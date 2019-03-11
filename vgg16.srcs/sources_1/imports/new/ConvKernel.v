`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2018 11:54:21 AM
// Design Name: 
// Module Name: ConvKernel
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

module ConvKernel#(
    parameter integer BITWIDTH = 8,   
    
    parameter integer DATACHANNEL = 16, 
    
    parameter integer FILTERHEIGHT = 3,
    parameter integer FILTERWIDTH = 3
    )
    (
    input clk,
    input rst,
    input [BITWIDTH * DATACHANNEL * FILTERHEIGHT * FILTERWIDTH - 1 : 0]data,
    input [BITWIDTH * DATACHANNEL * FILTERHEIGHT * FILTERWIDTH - 1 : 0]weight,
    input [BITWIDTH - 1 : 0] bias,
    output reg signed [BITWIDTH * 2 -1 : 0]result
    );
    
    wire signed [BITWIDTH * 2 - 1 : 0]out[FILTERHEIGHT * FILTERWIDTH * DATACHANNEL - 1 : 0];
    
    generate
        genvar i;
        for(i = 0; i < FILTERHEIGHT * FILTERWIDTH * DATACHANNEL; i = i + 1) begin
            mult_gen_0 mult (
                .CLK(clk),  // input wire CLK
                .A(data[(i + 1) * BITWIDTH - 1 : i * BITWIDTH]),      // input wire [7 : 0] A
                .B(weight[(i + 1) * BITWIDTH - 1 : i * BITWIDTH]),      // input wire [7 : 0] B
                .P(out[i])      // output wire [15 : 0] P
            );
//            Mult#(BITWIDTH) mult(data[(i + 1) * BITWIDTH - 1 : i * BITWIDTH], weight[(i + 1) * BITWIDTH - 1 : i * BITWIDTH], out[i]);
        end
    endgenerate
    
    integer j;
    always @(*) begin
        if(rst) begin
            result = {(BITWIDTH * 2){1'b0}};
        end else begin
            result = 0;
            for(j = 0; j < FILTERHEIGHT * FILTERWIDTH * DATACHANNEL; j = j + 1) begin
                result = result + ( (out[j] > {(BITWIDTH*2){1'b0}}) ? out[j] : {(BITWIDTH*2){1'b0}});
                // inplace ReLU finished here
            end
            result = result + bias;
        end
    end  
endmodule


module Conv3d_adder#(
    parameter integer DATANUM = 20
    )
    (
    input [16*DATANUM-1:0] kernelout,
    output reg signed [16-1:0] result
    );
    
    wire [15:0] temp[DATANUM-1:0];
    
    generate
        genvar j;
        for(j = 0; j < DATANUM; j = j + 1) begin
            Assi assi(.in(kernelout[16*(j+1)-1: 16*j]), .out(temp[j]));
        end
    endgenerate
    
    integer i;
    
    always @(*) begin
        result = 0;
        for(i=0;i<DATANUM;i=i+1) begin
             result = result + temp[i];
        end
    end
                    
endmodule

module Assi(
    input [15:0] in,
    output [15:0] out
    );
    assign out = in;
endmodule