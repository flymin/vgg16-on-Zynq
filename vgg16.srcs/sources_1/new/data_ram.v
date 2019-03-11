`timescale 1ns / 1ps
`include "define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2019 12:47:21 PM
// Design Name: 
// Module Name: data_ram
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


module in_ram(
input clk,
input rst,
input load_done,
input [21:0] dout_addr,
output [7:0] dout,
output reg [4:0] block,
output reg waiting
);

reg [4:0] onboard;
reg [3:0] stage;

//wire we0, we1, we2, we3, we4, we5, we6;
//wire [7:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6;

//assign dout =   dout_addr[21:19] == 3'd0 ? dout0 :
//                dout_addr[21:19] == 3'd1 ? dout1 :
//                dout_addr[21:19] == 3'd2 ? dout2 :
//                dout_addr[21:19] == 3'd3 ? dout3 :
//                dout_addr[21:19] == 3'd4 ? dout4 :
//                dout_addr[21:19] == 3'd5 ? dout5 :
//                                           dout6 ;
                                           
//assign we0 = din_addr[21:19] == 3'd0 ? WE : 1'b0;
//assign we1 = din_addr[21:19] == 3'd1 ? WE : 1'b0;
//assign we2 = din_addr[21:19] == 3'd2 ? WE : 1'b0;
//assign we3 = din_addr[21:19] == 3'd3 ? WE : 1'b0;
//assign we4 = din_addr[21:19] == 3'd4 ? WE : 1'b0;
//assign we5 = din_addr[21:19] == 3'd5 ? WE : 1'b0;
//assign we6 = din_addr[21:19] == 3'd6 ? WE : 1'b0;

blk_mem_gen_0 instance0 (
  .clka(clk),    // input wire clka
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(16'b0),  // input wire [16 : 0] addra
  .dina(8'b0),    // input wire [7 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(dout_addr[16:0]),  // input wire [16 : 0] addrb
  .doutb(dout)  // output wire [7 : 0] doutb
);

always @(posedge clk) begin
    if(rst) begin
        onboard <= 5'd31;
        stage <= `DATA_IDLE;
    end else begin
        case (stage)
            `DATA_IDLE : begin
                stage <= `DATA_TRANS;
                waiting <= 1'b1;
                block <= dout_addr[21:17];
            end
            `DATA_TRANS : begin
                if(load_done) begin
                    onboard <= block;
                    stage <= `DATA_READ;
                end else begin
                    stage <= stage;
                end
            end
            `DATA_READ : begin
                if(onboard != dout_addr[21:17]) begin
                    stage <= `DATA_IDLE;
                    waiting <= 1'b1;
                end else begin
                    waiting <= 1'b0;
                    stage <= stage;
                end
            end
        endcase
    end
end

//blk_mem_gen_0 instance1 (
//  .clka(clk),    // input wire clka
//  .wea(we1),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout1)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance2 (
//  .clka(clk),    // input wire clka
//  .wea(we2),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout2)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance3 (
//  .clka(clk),    // input wire clka
//  .wea(we3),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout3)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance4 (
//  .clka(clk),    // input wire clka
//  .wea(we4),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout4)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance5 (
//  .clka(clk),    // input wire clka
//  .wea(we5),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout5)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_1 instance6 (
//  .clka(clk),    // input wire clka
//  .wea(we6),      // input wire [0 : 0] wea
//  .addra(din_addr[15:0]),  // input wire [15 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[15:0]),  // input wire [15 : 0] addrb
//  .doutb(dout6)  // output wire [7 : 0] doutb
//);

endmodule


module out_ram(
input clk,
input rst,
input save_done,
input [21:0] din_addr,
input [7:0] din,
input WE,
output reg [4:0] block,
output reg waiting
);

reg [4:0] onboard;
reg [3:0] stage;

//wire we0, we1, we2, we3, we4, we5, we6;
//wire [7:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6;

//assign dout =   dout_addr[21:19] == 3'd0 ? dout0 :
//                dout_addr[21:19] == 3'd1 ? dout1 :
//                dout_addr[21:19] == 3'd2 ? dout2 :
//                dout_addr[21:19] == 3'd3 ? dout3 :
//                dout_addr[21:19] == 3'd4 ? dout4 :
//                dout_addr[21:19] == 3'd5 ? dout5 :
//                                           dout6 ;
                                           
//assign we0 = din_addr[21:19] == 3'd0 ? WE : 1'b0;
//assign we1 = din_addr[21:19] == 3'd1 ? WE : 1'b0;
//assign we2 = din_addr[21:19] == 3'd2 ? WE : 1'b0;
//assign we3 = din_addr[21:19] == 3'd3 ? WE : 1'b0;
//assign we4 = din_addr[21:19] == 3'd4 ? WE : 1'b0;
//assign we5 = din_addr[21:19] == 3'd5 ? WE : 1'b0;
//assign we6 = din_addr[21:19] == 3'd6 ? WE : 1'b0;

blk_mem_gen_0 instance0 (
  .clka(clk),    // input wire clka
  .wea(WE & stage == `DATA_READ),      // input wire [0 : 0] wea
  .addra(din_addr[16:0]),  // input wire [16 : 0] addra
  .dina(din),    // input wire [7 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(),  // input wire [16 : 0] addrb
  .doutb()  // output wire [7 : 0] doutb
);

always @(posedge clk) begin
    if(rst) begin
        onboard <= 5'd31;
        stage <= `DATA_IDLE;
    end else begin
        case (stage)
            `DATA_IDLE : begin
                stage <= `DATA_TRANS;
                waiting <= 1'b1;
                block <= din_addr[21:17];
            end
            `DATA_TRANS : begin
                if(save_done) begin
                    onboard <= block;
                    stage <= `DATA_READ;
                end else begin
                    stage <= stage;
                end
            end
            `DATA_READ : begin
                if(onboard != din_addr[21:17]) begin
                    stage <= `DATA_IDLE;
                    waiting <= 1'b1;
                end else begin
                    waiting <= 1'b0;
                    stage <= stage;
                end
            end
        endcase
    end
end

//blk_mem_gen_0 instance1 (
//  .clka(clk),    // input wire clka
//  .wea(we1),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout1)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance2 (
//  .clka(clk),    // input wire clka
//  .wea(we2),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout2)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance3 (
//  .clka(clk),    // input wire clka
//  .wea(we3),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout3)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance4 (
//  .clka(clk),    // input wire clka
//  .wea(we4),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout4)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance5 (
//  .clka(clk),    // input wire clka
//  .wea(we5),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout5)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_1 instance6 (
//  .clka(clk),    // input wire clka
//  .wea(we6),      // input wire [0 : 0] wea
//  .addra(din_addr[15:0]),  // input wire [15 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[15:0]),  // input wire [15 : 0] addrb
//  .doutb(dout6)  // output wire [7 : 0] doutb
//);

endmodule


module in_weight(
input clk,
input rst,
input weight_done,
input [26:0] dout_addr,
output [7:0] dout,
output reg [9:0] block,
output reg waiting
);

reg [9:0] onboard;
reg [3:0] stage;

//wire we0, we1, we2, we3, we4, we5, we6;
//wire [7:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6;

//assign dout =   dout_addr[21:19] == 3'd0 ? dout0 :
//                dout_addr[21:19] == 3'd1 ? dout1 :
//                dout_addr[21:19] == 3'd2 ? dout2 :
//                dout_addr[21:19] == 3'd3 ? dout3 :
//                dout_addr[21:19] == 3'd4 ? dout4 :
//                dout_addr[21:19] == 3'd5 ? dout5 :
//                                           dout6 ;
                                           
//assign we0 = din_addr[21:19] == 3'd0 ? WE : 1'b0;
//assign we1 = din_addr[21:19] == 3'd1 ? WE : 1'b0;
//assign we2 = din_addr[21:19] == 3'd2 ? WE : 1'b0;
//assign we3 = din_addr[21:19] == 3'd3 ? WE : 1'b0;
//assign we4 = din_addr[21:19] == 3'd4 ? WE : 1'b0;
//assign we5 = din_addr[21:19] == 3'd5 ? WE : 1'b0;
//assign we6 = din_addr[21:19] == 3'd6 ? WE : 1'b0;

blk_mem_gen_0 instance0 (
  .clka(clk),    // input wire clka
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(19'b0),  // input wire [16 : 0] addra
  .dina(8'b0),    // input wire [7 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(dout_addr[16:0]),  // input wire [16 : 0] addrb
  .doutb(dout)  // output wire [7 : 0] doutb
);

always @(posedge clk) begin
    if(rst) begin
        onboard <= 3'd7;
        stage <= `DATA_IDLE;
    end else begin
        case (stage)
            `DATA_IDLE : begin
                stage <= `DATA_TRANS;
                waiting <= 1'b1;
                block <= dout_addr[26:17];
            end
            `DATA_TRANS : begin
                if(weight_done) begin
                    onboard <= block;
                    stage <= `DATA_READ;
                end else begin
                    stage <= stage;
                end
            end
            `DATA_READ : begin
                if(onboard != dout_addr[26:17]) begin
                    stage <= `DATA_IDLE;
                    waiting <= 1'b1;
                end else begin
                    waiting <= 1'b0;
                    stage <= stage;
                end
            end
        endcase
    end
end

//blk_mem_gen_0 instance1 (
//  .clka(clk),    // input wire clka
//  .wea(we1),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout1)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance2 (
//  .clka(clk),    // input wire clka
//  .wea(we2),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout2)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance3 (
//  .clka(clk),    // input wire clka
//  .wea(we3),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout3)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance4 (
//  .clka(clk),    // input wire clka
//  .wea(we4),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout4)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_0 instance5 (
//  .clka(clk),    // input wire clka
//  .wea(we5),      // input wire [0 : 0] wea
//  .addra(din_addr[18:0]),  // input wire [18 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[18:0]),  // input wire [18 : 0] addrb
//  .doutb(dout5)  // output wire [7 : 0] doutb
//);

//blk_mem_gen_1 instance6 (
//  .clka(clk),    // input wire clka
//  .wea(we6),      // input wire [0 : 0] wea
//  .addra(din_addr[15:0]),  // input wire [15 : 0] addra
//  .dina(din),    // input wire [7 : 0] dina
//  .clkb(clk),    // input wire clkb
//  .addrb(dout_addr[15:0]),  // input wire [15 : 0] addrb
//  .doutb(dout6)  // output wire [7 : 0] doutb
//);

endmodule