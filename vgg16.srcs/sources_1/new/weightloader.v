`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 04:28:54 PM
// Design Name: 
// Module Name: weightloader
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


module weightloader(
input clk,
input rst,
input waiting,
// shared with FC
input [15:0] InWidth,
// shared with CONV
input [10:0] InChannel,
// from conv & FC (need spliter)
input [3:0] loader_mode,
input [7:0] times,
// from conv
input [10:0] channel,
// from FC
input [7:0] col_FC,
// to conv & FC
output reg weight_ready,
// to calculate
output reg [`bitWidth*`K_size*`K_size*`datachannel-1:0] weight,
// to/from input
output reg [26:0] weight_addr,
input [7:0] Inweight
);

reg [3:0] stage;
reg delay;
reg [7:0] counter;

always @(posedge clk) begin
if(rst) begin
    weight_ready <= 1'b0;
    weight <= {`bitWidth*`K_size*`K_size*`datachannel{1'b0}};
    weight_addr <= 27'b0;
    counter <= 8'b0;
end else if(~waiting) begin
    case (stage)
        `LOADER_IDLE : begin
            if(loader_mode != `LOADER_IDLE) begin
                weight <= {`bitWidth*`K_size*`K_size*`datachannel{1'b0}};
                weight_addr <= 27'b0;
                counter <= 8'b0;
            end
            weight_ready <= 1'b0;
        end
        `LOADER_1_1 : begin
            if(counter >= `K_size*`K_size*InChannel) begin
                stage <= `LOADER_DONE;
            end else begin
                if(~delay) begin
                    weight_addr <= `K_size*`K_size*InChannel*channel+counter;
                end else begin
                    stage <= `LOADER_1_1_1;
                    counter <= counter + 1;
                end
            end
        end
        `LOADER_1_1_1 : begin
            weight <= weight << 8 + Inweight;
            stage <= `LOADER_1_1;
            delay = 1'b0;
        end
        `LOADER_other : begin
            if(counter >= `K_size*`K_size*`datachannel) begin
                stage <= `LOADER_DONE;
            end else begin
                if(~delay) begin
                    weight_addr <= `K_size*`K_size*`datachannel*times
                                  +`K_size*`K_size*InChannel*channel 
                                  + counter;
                end else begin
                    stage <= `LOADER_other_1;
                    counter <= counter + 1;
                end
            end
        end
        `LOADER_other_1 : begin
            weight <= weight << 8 + Inweight;
            stage <= `LOADER_other_1;
            delay = 1'b0;
        end
        `LOADER_FC : begin
            if( counter >= `datachannel*`K_size*`K_size ) begin
                stage <= `LOADER_DONE;
            end else if(~delay) begin
                delay <= 1'b1;
                weight_addr <=    col_FC * InWidth +
                                `datachannel*`K_size*`K_size*times +
                                counter;
            end else begin
                weight <= weight << 8 + Inweight;
                delay <= 1'b0;
                counter <= counter + 1;
            end
        end
        `LOADER_FC : begin
            if(counter >= InWidth%(`datachannel*`K_size*`K_size)) begin
                stage <= `LOADER_DONE;
            end else if(~delay) begin
                delay <= 1'b1;
                weight_addr <=    col_FC * InWidth +
                                `datachannel*`K_size*`K_size*times +
                                counter;
            end else begin
                weight <= weight << 8 + Inweight;
                delay <= 1'b0;
                counter <= counter + 1;
            end
        end
        `LOADER_DONE : begin
            weight_ready <= 1'b0;
            if(loader_mode == `LOADER_IDLE) begin
                stage = `LOADER_IDLE;
            end
        end
    endcase
end
end //always

endmodule
