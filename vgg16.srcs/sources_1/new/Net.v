`timescale 1ns / 1ps
`include "define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2019 10:32:34 AM
// Design Name: 
// Module Name: Net
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


module Net(
input clk,
input rst,
input start,
input waiting,
input [15:0] InWidth,       // for FC
input [15:0] OutWidth,      // for FC
input [10:0] InChannel,     // for conv
input [10:0] OutChannel,    // for conv
input [7:0] Size,           // for conv
input [4:0] layer,          // conv, FC or pool
output layer_done,
output [21:0] data_addr,
input [7:0] Indata,
output [14:0] bias_addr,
input [7:0] Inbias,
output [26:0] weight_addr,
input [7:0] Inweight,
output [21:0] result_addr,
output [7:0] result,
output result_WE
);

wire[21:0] data_addr_dl, data_addr_pool;
assign data_addr = layer == `POOL ? data_addr_pool : data_addr_dl;

wire [7:0] temp_result;
wire weight_ready, data_ready;
wire [3:0] loader_mode;
wire [7:0] times;
// from conv
wire [10:0] channel;
wire [15:0] pos;
// from FC
wire [7:0] col_FC;

wire [`bitWidth*`K_size*`K_size*`datachannel-1:0] data;
wire [`bitWidth-1:0] bias;
wire [`bitWidth*`K_size*`K_size*`datachannel-1:0] weight;

wire start_conv, start_FC, start_pool;      // input
wire layer_done_CONV, layer_done_FC, layer_done_pool;   //output
wire [3:0] loader_mode_CONV, loader_mode_FC, loader_mode_pool;  // output
wire [7:0] times_CONV, times_FC, times_pool;            // output
wire [21:0] result_addr_CONV, result_addr_FC, result_addr_pool; //output
wire [7:0] result_CONV, result_FC, result_pool;         // output
wire result_WE_CONV, result_WE_FC, result_WE_pool;      // output

wire [31:0] out_sig_CONV, out_sig_FC, out_sig_pool;
assign out_sig_CONV = { layer_done_CONV, loader_mode_CONV, times_CONV,
                        result_addr_CONV, result_CONV, result_WE_CONV};
assign out_sig_FC = {   layer_done_FC, loader_mode_FC, times_FC,
                        result_addr_FC, result_FC, result_WE_FC};
assign out_sig_pool = { layer_done_pool, loader_mode_pool, times_pool,
                        result_addr_pool, result_pool, result_WE_pool};
assign { layer_done, loader_mode, times,
         result_addr, result, result_WE} = 
          layer == `CONV  ?   out_sig_CONV:
         (layer == `FC    ?   out_sig_FC:
                            out_sig_pool);
assign start_conv = layer == `CONV ? start:1'b0;
assign start_FC = layer == `FC ? start:1'b0;
assign start_pool = layer == `POOL ? start:1'b0;

dataloader dl(
.clk(clk),
.rst(rst),
.waiting(waiting),
// shared with FC
.InWidth(InWidth), 
// shared with CONV
.InChannel(InChannel),
.Size(Size),
// from conv & FC (need spliter)
.loader_mode(loader_mode),
.times(times),
// from conv
.channel(channel),
.pos(pos),
// from FC
.col_FC(col_FC),
// to conv & FC
.data_ready(data_ready),
// to calculate
.data(data),
.bias(bias),
// to/from input
.data_addr(data_addr_dl),
.Indata(Indata),
.bias_addr(bias_addr),
.Inbias(Inbias)
);

weightloader wl(
.clk(clk),
.rst(rst),
.waiting(waiting),
// shared with FC
.InWidth(InWidth),
// shared with CONV
.InChannel(InChannel),
// from conv & FC (need spliter)
.loader_mode(loader_mode),
.times(times),
// from conv
.channel(channel),
// from FC
.col_FC(col_FC),
// to conv & FC
.weight_ready(weight_ready),
// to calculate
.weight(weight),
// to/from input
.weight_addr(weight_addr),
.Inweight(Inweight)
);

conv_FSM conv_FSM(
.clk(clk),
.rst(rst),
.waiting(waiting),
.InChannel(InChannel),     // para shared with dataloader
.OutChannel(OutChannel),
.Size(Size),           // para shared with dataloader
.start(start_conv),                // from outside
.data_ready(weight_ready & data_ready),           // from dataloader
.layer_done(layer_done_CONV),      // to outside
// to dataloader
.loader_mode(loader_mode_CONV),   // special for conv 1-1
.channel(channel),      // which time this is in the whole cycle, No. of kernel
.pos(pos),          // used to get the index of input data
.times(times_CONV),
// from calculate
.temp_result(temp_result),
// to output
.result_addr(result_addr_CONV),
.result(result_CONV),
.result_WE(result_WE_CONV)
);

FC_FSM FC_FSM(
.clk(clk),
.rst(rst),
.waiting(waiting),
.InWidth(InWidth),       //share with dataloader
.OutWidth(OutWidth),
.start(start_FC),
.layer_done(layer_done_FC),
// to dataloader
.loader_mode(loader_mode_FC),
.col(col_FC),
.times(times_FC),
// from dataloader
.data_ready(weight_ready & data_ready),
// from calculate
.temp_result(temp_result),
// to output
.result_addr(result_addr_FC),
.result(result_FC),
.result_WE(result_WE_FC)
);

ConvKernel Kernel(
.clk(clk),
.rst(rst),
.data(data),
.weight(weight),
.bias(bias),
.result(temp_result)
);

pool pool(
.clk(clk),
.rst(rst),
.waiting(waiting),
.Channel(InChannel),
.Size(Size),
.start(start_pool),
.layer_done(layer_done_pool),
// to read
.Inaddr(data_addr_pool),
.Indata(Indata),
// to write
.Outaddr(result_addr_pool),
.Outdata(result_pool),
.WE(result_WE_pool)
);

endmodule
