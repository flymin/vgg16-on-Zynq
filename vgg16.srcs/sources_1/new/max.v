`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 06:47:24 PM
// Design Name: 
// Module Name: max
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


module max(
input [7:0] data1,
input [7:0] data2,
input [7:0] data3,
input [7:0] data4,
output [7:0] result
);

wire [7:0] temp1, temp2;
assign temp1 = data1 > data2 ? data1 : data2;
assign temp2 = data3 > data4 ? data3 : data4;
assign result = temp1 > temp2 ? temp1 : temp2;

endmodule
