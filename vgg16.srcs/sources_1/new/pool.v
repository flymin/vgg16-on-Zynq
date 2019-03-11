`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 06:25:37 PM
// Design Name: 
// Module Name: pool
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


module pool(
input clk,
input rst,
input waiting,
input [10:0] Channel,
input [7:0] Size,
input start,
output reg layer_done,
// to read
output reg [21:0] Inaddr,
input [7:0] Indata,
// to write
output reg [21:0] Outaddr,
output reg [7:0] Outdata,
output reg WE
);

reg [8*224*2-1:0] cache;
reg [3:0] stage;
reg [7:0] row, row_count, channel_count;
reg delay;
wire [7:0] temp1, temp2, temp3, temp4, max_temp;
integer i;

assign temp1 =  Size == 224 ? cache[448*8-1:447*8]:
                Size == 112 ? cache[224*8-1:223*8]:
                Size == 56 ?  cache[112*8-1:111*8]:
                Size == 28 ?  cache[56*8-1:55*8]:  
                Size == 14 ?  cache[28*8-1:27*8]:  
                8'b0;
assign temp2 =  Size == 224 ? cache[447*8-1:446*8]:
                Size == 112 ? cache[223*8-1:222*8]:
                Size == 56 ?  cache[111*8-1:110*8]:
                Size == 28 ?  cache[55*8-1:54*8]:  
                Size == 14 ?  cache[27*8-1:26*8]:  
                8'b0;
assign temp3 =  Size == 224 ? cache[224*8-1:223*8]:
                Size == 112 ? cache[112*8-1:111*8]:
                Size == 56 ?  cache[56*8-1:55*8]:
                Size == 28 ?  cache[28*8-1:27*8]:
                Size == 14 ?  cache[14*8-1:13*8]:
                8'b0;
assign temp4 =  Size == 224 ? cache[223*8-1:222*8]:
                Size == 112 ? cache[111*8-1:110*8]:
                Size == 56 ? cache[55*8-1:54*8]:
                Size == 28 ? cache[27*8-1:26*8]:
                Size == 14 ? cache[13*8-1:12*8]:
                8'b0;

max max(temp1, temp2, temp3, temp4, max_temp);
                
always @(posedge clk) begin
if(rst) begin
    for(i=0;i<224*2;i=i+1) begin
        cache[i] <= 8'b0;
    end
    layer_done <= 1'b0;
    Inaddr <= 22'd0;
    Outaddr <= 22'd0;
    Outdata <= 8'b0;
    WE <= 1'b0;
end else if(~waiting) begin
    case (stage)
        `POOL_IDLE : begin
            if(start) begin
                stage <= `POOL_CAL;
                row <= 8'b0;
                row_count <= 8'b0;
                delay <= 1'b0;
                channel_count <= 1'b0;
            end else begin
                WE <= 1'b0;
                stage <= stage;
                Inaddr <= 22'd0;
                Outaddr <= 22'd0;
                Outdata <= 8'b0;
                layer_done <= 1'b0;
            end
        end
        `POOL_INIT : begin
            if(row_count >= 2*Size && ~delay) begin
                stage <= `POOL_CAL;
            end else begin
                if(~delay) begin
                    Inaddr <=   channel_count*Size*Size +
                                row * Size + row_count;
                    delay <= 1'b1;
                    row_count <= row_count + 1;
                end else begin
                    cache <= cache << 8 + Indata;
                    delay <= 1'b0;
                end
            end
        end
        `POOL_CAL : begin
            if(channel_count >= Channel) begin
                stage <= `POOL_DONE;
            end else begin
                if(row >= Size) begin
                    channel_count <= channel_count + 1;
                    row <= 8'b0;
                    row_count <= 8'b0;
                    delay <= 1'b0;
                    WE <= 1'b0;
                end else begin
                    if(row_count <= Size) begin
                        stage <= `POOL_INIT;
                        delay <= 1'b0;
                        WE <= 1'b0;
                    end else begin
                        Outdata <= max_temp;
                        Outaddr <=  channel_count*(Size/2)*(Size/2) +
                                    (2*Size-row_count)/4;
                        cache <= cache << 16;
                        WE <= 1'b1;
                        row_count <= row_count - 4;
                    end
                end
            end
        end
        `POOL_DONE : begin
            layer_done <= 1'b1;
            if(~start) begin
                stage <= `POOL_IDLE;
            end
        end
    endcase
end
end // always

endmodule
