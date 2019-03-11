`timescale 1ns / 1ps
`include "define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 08:07:39 PM
// Design Name: 
// Module Name: FC_FSM
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


module FC_FSM(
input clk,
input rst,
input waiting,
input [15:0] InWidth,       //share with dataloader
input [15:0] OutWidth,
input start,
output reg layer_done,
// to dataloader
output reg [3:0] loader_mode,
output reg [7:0] col,
output reg [7:0] times,
// from dataloader
input data_ready,
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
    stage <= `FC_IDLE;
    loader_mode <= `LOADER_IDLE;
    layer_done <= 1'b0;
    times <= 8'd0;
    result_addr <= 22'd0;
    result <= 8'd0;
    result_WE <= 1'b0;
    delay <= 1'b0;
    col <= 8'd0;
end else if(~waiting) begin
    case (stage)
        `FC_IDLE : begin
            if(start) begin
                stage <= `FC_CAL;
                loader_mode <= `LOADER_FC;
                times <= 8'd0;
                col <= 8'd0;
            end else begin
                stage <= stage;
            end
            result_addr <= 22'd0;
            result <= 8'd0;
            result_WE <= 1'b0;
            layer_done <= 1'b0;
            loader_mode <= `LOADER_IDLE;
            delay <= 1'd0;
        end
        `FC_CAL : begin
            if(col >= OutWidth) begin
                stage <= `FC_DONE;
                layer_done <= 1'b1;
            end else begin
                if(times >= InWidth/(`datachannel*`K_size*`K_size))
                begin
                    stage <= `FC_LAST;
                end else if(data_ready & ~delay) begin
                    delay <= 1'b1;
                    loader_mode <= `LOADER_IDLE;
                end else if(delay) begin
                    result <= result + temp_result;
                    times <= times + 1;
                    delay <= 1'b0;
                end else begin
                    loader_mode <= `LOADER_FC;
                end
            end
        end
        `FC_LAST : begin
            // set loading with padding 0 to the end
            if(InWidth%(`datachannel*`K_size*`K_size) == 0) begin
                if(~result_WE) begin
                    loader_mode <= `LOADER_FC;
                    result_addr <= col;
                    result_WE <= 1'b1;
                end else if(result_WE) begin    // 1 cycle to write
                    result_WE <= 1'b0;
                    stage <= `FC_CAL;
                    col <= col + 1;
                    result <= 8'd0;
                    times <= 8'd0;
                end
            end else begin
                if(data_ready & ~delay & ~result_WE) begin
                    delay <= 1'b1;
                    loader_mode <= `LOADER_IDLE;
                end else if(delay) begin
                    result <= result + temp_result;
                    loader_mode <= `LOADER_FC;
                    result_addr <= col;
                    result_WE <= 1'b1;
                    delay <= 1'b0;
                end else if(result_WE) begin    // 1 cycle to write
                    result_WE <= 1'b0;
                    stage <= `FC_CAL;
                    col <= col + 1;
                    result <= 8'd0;
                    times <= 8'd0;
                end
            end
        end
        `FC_DONE : begin
            if(!start) begin
                stage <= `FC_IDLE;
            end
            loader_mode <= `LOADER_IDLE;
            result_WE <= 1'b0;
            layer_done <= layer_done;
        end
    endcase
end // if(rst) else
end //always

endmodule
