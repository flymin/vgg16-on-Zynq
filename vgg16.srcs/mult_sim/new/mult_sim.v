`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2018 12:37:06 AM
// Design Name: 
// Module Name: simu_wrapper
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

module mult_sim();

reg CLK;
reg [7:0] A;
reg [7:0] B;
wire [15:0] P;

mult_gen_0 mult_my (
  .CLK(CLK),  // input wire CLK
  .A(A),      // input wire [7 : 0] A
  .B(B),      // input wire [7 : 0] B
  .P(P)      // output wire [15 : 0] P
);

initial begin
    CLK = 1;
    #10;
    A = 10;
    B = 11;
    #90;
    A = 11;
    B = 11;
    #10;
    A = 12;
    B = 12;
    #50;
    A = 13;
    B = 13;
end

always #5 begin
    CLK = ~CLK;
end

endmodule