`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 10:35:31 AM
// Design Name: 
// Module Name: 
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
`define CONV (4'd0)
`define FC (4'd1)
`define POOL (4'd2)

`define IDLE (4'd0)
`define CONV_1_1 (4'd1)
`define CONV_other (4'd2)
`define CONV_DONE (4'd3)

`define LOADER_IDLE (4'd0)
`define LOADER_1_1 (4'd1)
`define LOADER_other (4'd2)
`define LOADER_DONE (4'd3)
`define LOADER_other_1 (4'd4)
`define LOADER_1_1_1 (4'd5)
`define LOADER_FC (4'd6)
`define LOADER_FC_LAST (4'd7)

`define bitWidth (8)
`define datachannel (16)
`define K_size (3)

`define POOL_IDLE (4'd0)
`define POOL_INIT (4'd1)
`define POOL_CAL (4'd2)
`define POOL_DONE (4'd3)

`define FC_IDLE (4'd0)
`define FC_CAL (4'd1)
`define FC_DONE (4'd2)
`define FC_LAST (4'd3)

`define DATA_IDLE (4'd0)
`define DATA_TRANS (4'd1)
`define DATA_READ (4'd2)

