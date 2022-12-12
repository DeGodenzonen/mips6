`timescale 1ns / 1ps
module mm_wb(input clk,input reset,
             input [31:0] y_ex_mm,
              output reg [31:0] y_mm_wb,
              input [31:0] data,
              output reg [31:0] data_mm_wb,
              input [4:0] dstn_ex_mm,
              output reg [4:0] dstn_mm_wb,
              input RegWrite_ex_mm,
              output reg RegWrite_mm_wb,
              input MemtoReg_ex_mm,
              output reg MemtoReg_mm_wb,
              input [4:0] rs_ex_mm,
             output reg [4:0] rs_mm_wb,
             input [4:0] rt_ex_mm,
             output reg [4:0] rt_mm_wb);
 always@(posedge clk)
 begin
 if(reset==0)
   begin
   RegWrite_mm_wb<=0;
   MemtoReg_mm_wb<=0;
   y_mm_wb<=0;
   data_mm_wb<=0;
   dstn_mm_wb<=0;
    rs_mm_wb<=0;
     rt_mm_wb<=0;
   end
 else
   begin
   
   RegWrite_mm_wb<=RegWrite_ex_mm;
   MemtoReg_mm_wb<=MemtoReg_ex_mm;
   y_mm_wb<=y_ex_mm;
   data_mm_wb<=data;
   dstn_mm_wb<=dstn_ex_mm;
    rs_mm_wb<=rs_mm_wb;
     rt_mm_wb<=rt_mm_wb;
   end
 end
endmodule
