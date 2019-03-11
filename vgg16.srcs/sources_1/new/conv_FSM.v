`timescale 1ns / 1ps
`include  "define.v" 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 10:31:53 AM
// Design Name: 
// Module Name: conv_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv_FSM(
input clk,
input rst,
input waiting,
input [10:0] InChannel,     // para shared with dataloader
input [10:0] OutChannel,
input [7:0] Size,           // para shared with dataloader
input start,                // from outside
input data_ready,           // from dataloader
output reg layer_done,      // to outside
// to dataloader
output reg [3:0] loader_mode,   // special for conv 1-1
output reg [10:0] channel,      // which time this is in the whole cycle, No. of kernel
output reg [15:0] pos,          // used to get the index of input data
output reg [7:0] times,
// from calculate
input [7:0] temp_result,
// to output
output reg [21:0] result_addr,
output reg [7:0] result,
output reg result_WE
);

reg [3:0] stage;
reg delay;

always @(posedge clk) begin
if(rst) begin
    stage <= `IDLE;
    loader_mode <= `LOADER_IDLE;
    channel <= 11'd0;
    result_addr <= 22'd0;
    result <= 8'd0;
    result_WE <= 1'b0;
    layer_done <= 1'b0;
    pos <= 16'b0;
    times <= 8'd0;
end else if(~waiting) begin
    case (stage)
        `IDLE : begin
            if(start) begin
                if(InChannel == 3) begin
                    stage <= `CONV_1_1;
                    loader_mode <= `LOADER_1_1;
                end else begin
                    stage <= `CONV_other;
                    loader_mode <= `LOADER_other;
                end
            end else begin
                stage <= stage;
            end
            channel <= 11'd0;
            result_WE <= 1'b0;
            layer_done <= 1'b0;
            pos <= 16'b0;
            times <= 8'd0;
        end
        `CONV_1_1 : begin
            if(channel >= OutChannel) begin
                stage <= `CONV_DONE;
                layer_done <= 1'b1;
            end else begin
                stage <= stage;
                if(pos < Size * Size) begin
                // tell dataloader to load data for calculate
                    if(times*16 < InChannel) begin
                        if(data_ready & ~delay) begin
                            delay <= 1'b1;
                            loader_mode <= `LOADER_IDLE;
                        end else if(delay) begin
                            result <= result + temp_result;
                            times <= times + 1;
                            delay <= 1'b0;
                            loader_mode <= `LOADER_1_1;
                        end
                    end else begin
                        if(~delay) begin
                            result_addr <= Size * Size * channel + pos; //change later
                            result_WE <= 1'b1;
                            delay <= 1'b1;
                            pos <= pos + 1;
                        end else if (delay) begin
                            result_WE <= 1'b0;
                            loader_mode <= `LOADER_1_1;     // this will erase data in next clock cycle
                            delay <= 1'b0;
                            times <= 8'd0;
                            result <= 8'd0;
                        end
                    end
                end else begin
                    channel <= channel + 1;
                    result_WE <= 1'b0;
                    delay <= 1'b0;
                    pos <= 16'b0;
                end
            end
        end
        `CONV_other : begin
            if(channel >= OutChannel) begin
                stage <= `CONV_DONE;
                layer_done <= 1'b1;
            end else begin
                stage <= stage;
                if(pos < Size * Size) begin
                // tell dataloader to load data for calculate
                    if(times*16 < InChannel) begin
                        if(data_ready & ~delay) begin
                            delay <= 1'b1;
                            loader_mode <= `LOADER_IDLE;
                        end else if(delay) begin
                            result <= result + temp_result;
                            times <= times + 1;
                            delay <= 1'b0;
                            loader_mode <= `LOADER_other;
                        end
                    end else begin
                        if(~delay) begin
                            result_addr <= Size * Size * channel + pos; //change later
                            result_WE <= 1'b1;
                            delay <= 1'b1;
                            pos <= pos + 1;
                        end else if (delay) begin
                            result_WE <= 1'b0;
                            loader_mode <= `LOADER_other;     // this will erase data in next clock cycle
                            delay <= 1'b0;
                            times <= 8'd0;
                            result <= 8'd0;
                        end
                    end
                end else begin
                    channel <= channel + 1;
                    result_WE <= 1'b0;
                    delay <= 1'b0;
                    pos <= 16'b0;
                end
            end
        end
        `CONV_DONE : begin
            if(~start) begin
                stage <= `IDLE;
            end
            loader_mode <= `LOADER_IDLE;
            result_WE <= 1'b0;
            layer_done <= layer_done; // already set to 1 on finish
        end
    endcase
end // if(rst) else
end // always

endmodule
