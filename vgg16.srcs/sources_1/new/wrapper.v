`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2019 11:33:55 AM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
input clk,
input rst,
input start,
input load_done,
input save_done,
input weight_done,
output [4:0] block_read,
output [4:0] block_save,
output [9:0] block_weight,
output waiting_read,
output waiting_save,
output waiting_weight,
input [15:0] InWidth,       // for FC
input [15:0] OutWidth,      // for FC
input [10:0] InChannel,     // for conv
input [10:0] OutChannel,    // for conv
input [7:0] Size,           // for conv
input [4:0] layer,          // conv, FC or pool
output layer_done
);

wire [21:0] data_addr;
wire [7:0] Indata;
wire [14:0] bias_addr;
wire [7:0] Inbias;
wire [26:0] weight_addr;
wire [7:0] Inweight;
wire [21:0] result_addr;
wire [7:0] result;
wire result_WE;
wire waiting, waiting_read, waiting_save, waiting_weight;

assign waiting = waiting_read | waiting_save | waiting_weight;
//wire [7:0] Indata_A, Indata_B;
//wire result_WE_A, result_WE_B;

//assign result_WE_A = bram ? result_WE : 1'b0;
//assign result_WE_B = ~bram ? result_WE : 1'b0;
//assign Indata = bram ? Indata_B : Indata_A;

in_ram in_ram(
.clk(clk),
.rst(rst),
.load_done(load_done),
.dout_addr(data_addr),
.dout(Indata),
.block(block_read),
.waiting(waiting_read)
);

out_ram out_ram(
.clk(clk),
.rst(rst),
.save_done(save_done),
.din_addr(result_addr),
.din(result),
.WE(result_WE),
.block(block_save),
.waiting(waiting_save)
);

in_weight in_weight(
.clk(clk),
.rst(rst),
.weight_done(weight_done),
.dout_addr(weight_addr),
.dout(Inweight),
.block(block_weight),
.waiting(waiting_weight)
);

blk_mem_gen_0 instance0 (
  .clka(clk),    // input wire clka
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(16'b0),  // input wire [16 : 0] addra
  .dina(8'b0),    // input wire [7 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(bias_addr),  // input wire [16 : 0] addrb
  .doutb(Inbias)  // output wire [7 : 0] doutb
);

Net Net(
.clk(clk),
.rst(rst),
.start(start),
.waiting(waiting),
.InWidth(InWidth),       // for FC
.OutWidth(OutWidth),      // for FC
.InChannel(InChannel),     // for conv
.OutChannel(OutChannel),    // for conv
.Size(Size),           // for conv
.layer(layer),          // conv, FC or pool
.layer_done(layer_done),
.data_addr(data_addr),
.Indata(Indata),
.bias_addr(bias_addr),
.Inbias(Inbias),
.weight_addr(weight_addr),
.Inweight(Inweight),
.result_addr(result_addr),
.result(result),
.result_WE(result_WE)
);

endmodule
