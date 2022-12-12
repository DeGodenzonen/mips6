`timescale 1ns / 1ps
module ex_mm(input clk, input reset,
             input [4:0] dstn_rr_ex,
             output reg [4:0] dstn_ex_mm,
             input [31:0] y,                   //alu result
             output reg [31:0] y_ex_mm,
             input [31:0] foutput2,   // data to be written in dmem if sw
             output reg [31:0] foutput2_ex_mm,
             input MemRead_rr_ex,
             output reg MemRead_ex_mm,
             input MemWrite_rr_ex,
             output reg MemWrite_ex_mm,
             input MemtoReg_rr_ex,
             output reg MemtoReg_ex_mm,
             input RegWrite_rr_ex,
             output reg  RegWrite_ex_mm,
             input [4:0] rs_rr_ex,
             output reg [4:0] rs_ex_mm,
             input [4:0] rt_rr_ex,
             output reg [4:0] rt_ex_mm
             );
    
 always@(posedge clk)
 begin
 if(reset==0)
   begin
   MemRead_ex_mm<=0;
   MemWrite_ex_mm<=0;
   dstn_ex_mm<=0;
   y_ex_mm<=0;
  foutput2_ex_mm<=0;
   MemtoReg_ex_mm<=0;
   RegWrite_ex_mm<=0;
   rs_ex_mm<=0;
   rt_ex_mm<=0;
   
   
   end
 else
   begin
   MemRead_ex_mm<=MemRead_rr_ex;
   MemWrite_ex_mm<=MemWrite_rr_ex;
    dstn_ex_mm<= dstn_rr_ex;
    y_ex_mm<=y;
    foutput2_ex_mm<=foutput2;
    MemtoReg_ex_mm<=MemtoReg_rr_ex;
   RegWrite_ex_mm<=RegWrite_rr_ex;
   rs_ex_mm<=rs_rr_ex;
   rt_ex_mm<=rt_rr_ex;
   end
end
   
   
endmodule
