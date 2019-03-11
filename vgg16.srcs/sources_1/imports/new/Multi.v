`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2018 11:59:34 AM
// Design Name: 
// Module Name: Multi
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


module Mult#(
    parameter BITWIDTH = 8
    )
    (
    input signed [BITWIDTH-1:0] a,
    input signed [BITWIDTH-1:0] b,
    output signed [BITWIDTH * 2 - 1:0] c
    );
    
    assign c = a * b;
    //assign c = 1;
    
endmodule