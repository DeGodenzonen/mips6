`timescale 1ns / 1ps

module decode(input [31:0] Instruction_Code,input [31:0] PC_if_id,output reg [4:0] rs,output reg [4:0] rt,
              output reg [4:0]  rd,output reg [4:0] shamt,output reg [5:0] funct,
              output reg [32:0] extended ,output reg [5:0] opcode);


always@(Instruction_Code)
begin
   assign opcode = Instruction_Code[31:26];
   case(opcode)
      6'b100011:begin                                //lw
                rs <= Instruction_Code[25:21];
                rt <= Instruction_Code[20:16]; 
                extended <= {{16{Instruction_Code[15]}},Instruction_Code[15:0]};
                end
                
      6'b101011:begin                               //sw
                rs <= Instruction_Code[25:21];
                rt <= Instruction_Code[20:16]; 
                extended <= {{16{Instruction_Code[15]}},Instruction_Code[15:0]};
                end
                
      6'b000000:begin                                //or
                rs <= Instruction_Code[25:21];
                rt <= Instruction_Code[20:16]; 
                rd <= Instruction_Code[15:11];
                shamt<= Instruction_Code[10:6];
                funct <= Instruction_Code[5:0];
                end
       
       6'b001100:begin                              //andi
                rs <= Instruction_Code[25:21];
                rt <= Instruction_Code[20:16]; 
                extended <= {{16{Instruction_Code[15]}},Instruction_Code[15:0]};
                end 
                
       6'b000010:begin                               //jump
                extended<={PC_if_id[31:28],Instruction_Code[26:0],2'b00};
                end 
        
        default:begin 
                rs <= 0;
                rt <= 0; 
                rd <= 0;
                shamt<= 0;
                funct <= 0;
                end
    endcase
end
endmodule