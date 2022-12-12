`timescale 1ns / 1ps



module rr_ex(input clk,input reset,
             input [31:0] Read_Data_1,
             output reg [31:0]  Read_Data_1_rr_ex,
             input [31:0] Read_Data_2,
             output reg [31:0]  Read_Data_2_rr_ex, 
             input [4:0]  dstn,
             output reg [4:0] dstn_rr_ex,
             input [31:0] extended_id_rr,
             output reg [31:0] extended_rr_ex,          
             input [5:0] funct_id_rr,
             output reg [5:0] funct_rr_ex,
             input jump_id_rr,
             output reg jump_rr_ex,
             input MemRead_id_rr,
             output reg MemRead_rr_ex,
             input MemWrite_id_rr,
             output reg MemWrite_rr_ex ,
             input ALUSrc_id_rr,
             output reg ALUSrc_rr_ex,
             input [1:0] ALUOp_id_rr,
             output reg [1:0] ALUOp_rr_ex,
             input MemtoReg_id_rr,
             output reg MemtoReg_rr_ex,
             input RegWrite_id_rr,
             output reg RegWrite_rr_ex,
             input [4:0] rs_id_rr,
             output reg [4:0] rs_rr_ex,
             input [4:0] rt_id_rr,
             output reg [4:0] rt_rr_ex);
 always@(posedge clk)
 begin
 if(reset==0)
   begin
         Read_Data_1_rr_ex<=0;
         Read_Data_2_rr_ex<=0;
         dstn_rr_ex<=0;
         extended_rr_ex<=0;
         funct_rr_ex<=0; 
         jump_rr_ex<=0;
         MemRead_rr_ex<=0;
         MemWrite_rr_ex<=0 ;
         ALUSrc_rr_ex<= 0;     
         ALUOp_rr_ex<=0;
         MemtoReg_rr_ex<=0;
         RegWrite_rr_ex<=0;
         rs_rr_ex<=0;
         rt_rr_ex<=0;
    end
    
  else
  begin
         Read_Data_1_rr_ex<= Read_Data_1;
         Read_Data_2_rr_ex<= Read_Data_2;
         dstn_rr_ex<=dstn;
         extended_rr_ex<=extended_id_rr; 
         funct_rr_ex<= funct_id_rr; 
         jump_rr_ex<=jump_id_rr;
         MemRead_rr_ex<=MemRead_id_rr;
         MemWrite_rr_ex<=MemWrite_id_rr;
         ALUSrc_rr_ex<= ALUSrc_id_rr;     
         ALUOp_rr_ex<=ALUOp_id_rr;
         MemtoReg_rr_ex<=MemtoReg_id_rr;
         RegWrite_rr_ex<=RegWrite_id_rr;
          rs_rr_ex<=rs_id_rr;
         rt_rr_ex<=rt_id_rr;
 end        
end  
endmodule
