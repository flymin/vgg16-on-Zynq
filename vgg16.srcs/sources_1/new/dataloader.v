`timescale 1ns / 1ps
`include "define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 01:29:20 PM
// Design Name: 
// Module Name: dataloader
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


module dataloader(
input clk,
input rst,
input waiting,
// shared with FC
input [15:0] InWidth, 
// shared with CONV
input [10:0] InChannel,
input [7:0] Size,
// from conv & FC (need spliter)
input [3:0] loader_mode,
input [7:0] times,
// from conv
input [10:0] channel,
input [15:0] pos,
// from FC
input [7:0] col_FC,
// to conv & FC
output reg data_ready,
// to calculate
output reg [`bitWidth*`K_size*`K_size*`datachannel-1:0] data,
output reg [`bitWidth-1:0] bias,
// to/from input
output reg [21:0] data_addr,
input [7:0] Indata,
output reg [14:0] bias_addr,
input [7:0] Inbias
);

reg [3:0] stage;
reg delay1, delay2;
reg [7:0] row, col;
reg [7:0] row_counter, col_counter, channel_counter;

always @(posedge clk) begin
if(rst) begin
    stage <= `LOADER_IDLE;
    data <= {`bitWidth*`K_size*`K_size*`datachannel{1'b0}};
    bias <= 8'b0;
    data_addr <= 22'b0;
    bias_addr <= 12'b0;
    data_ready <= 1'b0;
end else if(~waiting) begin
    case (stage)
        `LOADER_IDLE : begin
            if(loader_mode != `LOADER_IDLE) begin
                stage <= loader_mode;
                data <= {`bitWidth*`K_size*`K_size*`datachannel{1'b0}};
                bias <= 8'b0;
                data_addr <= 22'b0;
                row <= pos/Size;
                col <= pos%Size;
                bias_addr <= channel;
                channel_counter <= 8'd0;
                row_counter <= 8'd0;
                col_counter <= 8'd0;
                delay1 = 1'b0;
                delay2 = 1'b0;
            end
            data_ready <= 1'b0;
        end
        `LOADER_1_1 : begin
            if(~delay1) begin
                bias_addr <= channel;
                delay1 = 1'b1;
            end else begin
                bias <= Inbias;
            end
            if(channel_counter >= InChannel && ~delay2) begin // 3*3*16
                stage <= `LOADER_DONE;
            end else begin
                if((col+col_counter == 0 || col+col_counter == Size + 1 ||
                    row+row_counter == 0 || row+row_counter == Size + 1 ) 
                   && ~delay2) begin
                    data <= data << 8;      // doing padding
                end else begin
                    if(~delay2) begin
                        data_addr <= channel_counter*Size*Size 
                                    +(row+row_counter-1)*Size + col+col_counter-1;
                        delay2 <= 1'b1;
                    end else begin
                        stage <= `LOADER_1_1_1;
                    end
                end
                if(~delay2) begin
                    if(row_counter >= 2 && col_counter >= 2) begin
                        row_counter <= 0;
                        col_counter <= 0;
                        channel_counter <= channel_counter+1;
                    end else if(col_counter >= 2) begin
                        row_counter <= row_counter + 1;
                        col_counter <= 0;
                    end else begin
                        col_counter <= col_counter + 1;
                    end
                end
            end
        end
        `LOADER_1_1_1 : begin
            data <= data << 8 + Indata;
            stage <= `LOADER_1_1;
            delay2 = 1'b0;
        end
        `LOADER_other : begin
            if(~delay1) begin
                bias_addr <= channel;
                delay1 = 1'b1;
            end else begin
                bias <= Inbias;
            end
            if(channel_counter >= `datachannel && ~delay2) begin // 3*3*16
                stage <= `LOADER_DONE;
            end else begin
                if((col+col_counter == 0 || col+col_counter == Size + 1 ||
                    row+row_counter == 0 || row+row_counter == Size + 1 ) 
                   && ~delay2) begin
                    data <= data << 8;      // doing padding
                end else begin
                    if(~delay2) begin
                        data_addr <= times*`datachannel*Size*Size+
                                     channel_counter*Size*Size+ 
                                    (row+row_counter-1)*Size + col+col_counter-1;
                        delay2 <= 1'b1;
                    end else begin
                        stage <= `LOADER_other_1;
                    end
                end
                if(~delay2) begin
                    if(row_counter >= 2 && col_counter >= 2) begin
                        row_counter <= 0;
                        col_counter <= 0;
                        channel_counter <= channel_counter + 1;
                    end else if(col_counter >= 2) begin
                        row_counter <= row_counter + 1;
                        col_counter <= 0;
                    end else begin
                        col_counter <= col_counter + 1;
                    end
                end
            end
        end
        `LOADER_other_1 : begin
            data <= data << 8 + Indata;
            stage <= `LOADER_other;
            delay2 <= 1'b0;
        end
        `LOADER_FC : begin
            if(~delay2) begin
                bias_addr <= col_FC;
                delay2 = 1'b1;
            end else begin
                bias <= Inbias;
            end
            if( row_counter >= `datachannel*`K_size*`K_size ) begin
                stage <= `LOADER_DONE;
            end else if(~delay1) begin
                delay1 <= 1'b1;
                data_addr <=    `datachannel*`K_size*`K_size*times +
                                row_counter;
            end else begin
                data <= data << 8 + Indata;
                delay1 <= 1'b0;
                row_counter <= row_counter + 1;
            end
        end
        `LOADER_FC_LAST : begin
            if(~delay2) begin
                bias_addr <= col_FC;
                delay2 = 1'b1;
            end else begin
                bias <= Inbias;
            end
            if(row_counter >= InWidth%(`datachannel*`K_size*`K_size)) begin
                stage <= `LOADER_DONE;
            end else if(~delay1) begin
                delay1 <= 1'b1;
                data_addr <=    `datachannel*`K_size*`K_size*times +
                                row_counter;
            end else begin
                data <= data << 8 + Indata;
                delay1 <= 1'b0;
                row_counter <= row_counter + 1;
            end
        end
        `LOADER_DONE : begin
            data_ready <= 1'b1;
            if(loader_mode == `LOADER_IDLE) begin
                stage = `LOADER_IDLE;
            end
        end
    endcase
end // if(rst) else
end //always

endmodule
