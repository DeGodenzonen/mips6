`timescale 1ns / 1ps
module writeback(input  MemtoReg_mm_wb,input [31:0] y_mm_wb,input [31:0] data,output reg [31:0] datafrom_mm_wb);
always@(*)
 begin

 datafrom_mm_wb=  MemtoReg_mm_wb? data:y_mm_wb;    //memdata is the data to be written in register

 end
endmodule
