`timescale 1ns / 1ps

module If_Id(input [31:0] Instruction_code,input clk,input reset,input stall,input jump,output reg [31:0] Instruction_code_IfId ,input [31:0] PC,output reg [31:0] PC_if_id);

always@(posedge clk)
begin
  if(reset==0)
  begin
    Instruction_code_IfId<=32'd0;
    PC_if_id<=0;
  end
  else if(jump==1)
  begin
   Instruction_code_IfId<=32'hF0000000;
   PC_if_id<=PC;
  end
  else if (stall==1)
  begin
    Instruction_code_IfId<=Instruction_code_IfId;
    PC_if_id<=PC_if_id;
  end
  else
  begin
    Instruction_code_IfId<=Instruction_code;
    PC_if_id<=PC;
  end
end   

endmodule
