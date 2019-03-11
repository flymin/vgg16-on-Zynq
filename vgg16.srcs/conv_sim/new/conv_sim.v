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

module conv_sim();

reg clk, rst;
reg [8*3*3*16-1:0] data, weight;
reg [8-1:0] bias;
wire [16-1:0] result;

ConvKernel conv(
    .clk(clk),
    .rst(rst),
    .data(data),
    .weight(weight),
    .bias(bias),
    .result(result)
    );

initial begin
    clk = 0;
    rst = 1;
    data = 1152'b0;
    weight = 1152'b0;
    bias = 8'd0;
    #100;
    rst = 0;
    data = {1152{1'b1}};
    weight = {1152{1'b1}};
    bias = 8'd2;
end

always #5 begin
    clk = ~clk;
end

endmodule