`timescale 1ns / 1ps

module mcu(input [5:0] opcode,input stall, output reg RegDst ,output reg jump,output reg MemRead,
           output reg MemWrite , output reg ALUSrc, output reg [1:0] ALUOp, output reg MemtoReg,
           output reg RegWrite);
  
always@(*)
begin
if(stall==1)
 begin
 RegDst=1'bx;
            jump=1'bx;
            MemRead=1'bx;
            MemWrite=1'b0;
            ALUSrc=1'bx;
            ALUOp=2'bxx;
            MemtoReg= 1'bx;      
            RegWrite=1'b0;
 end
 
 else
  case(opcode)
  6'b100011:begin        //lw
            RegDst=1'b0;
            jump=1'b0;
            MemRead=1'b1;
            MemWrite=1'b0;
            ALUSrc=1'b1;
            ALUOp=2'b00;
            MemtoReg= 1'b1;      
            RegWrite=1'b1;
            end
            
   6'b101011:begin       //sw
            RegDst=1'bx;
            jump=1'b0;
            MemRead=1'b0;
            MemWrite=1'b1;
            ALUSrc=1'b1;
            ALUOp=2'b00;
            MemtoReg= 1'b0;      
            RegWrite=1'b0;
            end       
   
   6'b000000:begin        //or
            RegDst=1'b1;
            jump=1'b0;
            MemRead=1'b0;
            MemWrite=1'b0;
            ALUSrc=1'b0;
            ALUOp=2'b10;
            MemtoReg= 1'b0;      
            RegWrite=1'b1;
            end                   
    
  6'b001100:begin        //andi
            RegDst=1'b1;
            jump=1'b0;
            MemRead=1'b0;
            MemWrite=1'b0;
            ALUSrc=1'b1;
            ALUOp=2'b11;       
            MemtoReg= 1'b0;      
            RegWrite=1'b1;
            end       


    6'b000010:begin      //jump
            RegDst=1'bx;
            jump=1'b1;
            MemRead=1'bx;
            MemWrite=1'b0;
            ALUSrc=1'bx;
            ALUOp=2'bxx;
            MemtoReg= 1'bx;      
            RegWrite=1'b0;
            end 
   
    6'b111100:begin       //sw
            RegDst=1'b0;
            jump=1'b0;
            MemRead=1'b0;
            MemWrite=1'b0;
            ALUSrc=1'b0;
            ALUOp=2'b00;
            MemtoReg= 1'b0;      
            RegWrite=1'b0;
            end                        
   endcase
 
   
end
endmodule
