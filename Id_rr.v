`timescale 1ns / 1ps
module Id_Rr(input clk,input reset,input stall,
             input [4:0] rs,
             output reg [4:0] rs_id_rr,
             input [4:0] rt,
             output reg [4:0] rt_id_rr,
             input [4:0] rd,
             output reg [4:0]  rd_id_rr,
             input [4:0] shamt,
             output reg [4:0] shamt_id_rr,
             input [5:0] funct,
             output reg [5:0] funct_id_rr,
             input [31:0] extended, 
             output reg [31:0] extended_id_rr ,
             input RegDst,
             output reg RegDst_id_rr ,
             input jump,
             output reg jump_id_rr,
             input MemRead,
             output reg MemRead_id_rr,
             input MemWrite,
             output reg MemWrite_id_rr ,
             input ALUSrc,
             output reg ALUSrc_id_rr,
             input [1:0] ALUOp,
             output reg [1:0] ALUOp_id_rr,
             input MemtoReg,
             output reg MemtoReg_id_rr,
             input RegWrite,
             output reg RegWrite_id_rr);
             
 always@(posedge clk)
 begin
   if(reset==0)
    begin
    rs_id_rr<=4'b0000;
    rt_id_rr<=4'b0000;
    rd_id_rr<=4'b0000;
    shamt_id_rr<=4'b0000;
    funct_id_rr<=5'b00000;
    extended_id_rr<=32'b0;
     RegDst_id_rr<=0 ;
     jump_id_rr<=0;
     MemRead_id_rr<=0;
     MemWrite_id_rr<=0 ;
     ALUSrc_id_rr<= 0;     
     ALUOp_id_rr<=0;
     MemtoReg_id_rr<=0;
     RegWrite_id_rr<=0;
    
    end
    else if (stall==1)
    begin
    rs_id_rr<=rs_id_rr;
    rt_id_rr<=rt_id_rr;
    rd_id_rr<=rd_id_rr;
    shamt_id_rr<=shamt_id_rr;
    funct_id_rr<=funct_id_rr;
    extended_id_rr<=extended_id_rr;
     RegDst_id_rr<=RegDst_id_rr ;
     jump_id_rr<=jump_id_rr;
     MemRead_id_rr<=MemRead_id_rr;
     MemWrite_id_rr<=MemWrite_id_rr ;
     ALUSrc_id_rr<= ALUSrc_id_rr;     
     ALUOp_id_rr<= ALUOp_id_rr;
     MemtoReg_id_rr<=MemtoReg_id_rr;
     RegWrite_id_rr<=RegWrite_id_rr;
    end
    else
    begin
    rs_id_rr<=rs;
    rt_id_rr<=rt;
    rd_id_rr<=rd;
    shamt_id_rr<=shamt;
    funct_id_rr<=funct;
    extended_id_rr<=extended;
     RegDst_id_rr<=RegDst ;
     jump_id_rr<=jump;
     MemRead_id_rr<=MemRead;
     MemWrite_id_rr<=MemWrite ;
     ALUSrc_id_rr<= ALUSrc;     
     ALUOp_id_rr<=ALUOp;
     MemtoReg_id_rr<=MemtoReg;
     RegWrite_id_rr<=RegWrite;
    
   
    end
 end   
endmodule
