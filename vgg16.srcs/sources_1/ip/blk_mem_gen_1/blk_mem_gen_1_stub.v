// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Tue Jan 15 13:05:54 2019
// Host        : eda-srv running 64-bit Red Hat Enterprise Linux Server release 6.6 (Santiago)
// Command     : write_verilog -force -mode synth_stub
//               /home/class18/gaoruiyuan/vgg16/vgg16.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_stub.v
// Design      : blk_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module blk_mem_gen_1(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[15:0],dina[7:0],clkb,addrb[15:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [15:0]addra;
  input [7:0]dina;
  input clkb;
  input [15:0]addrb;
  output [7:0]doutb;
endmodule
