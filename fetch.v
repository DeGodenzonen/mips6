`timescale 1ns / 1ps
module fetch(input clk, input reset,input jump, input [31:0] extended,input stall,output wire [31:0] Instruction_Code,output reg [31:0] PC);
instruction_memory a1(.PC(PC), .reset(reset), .Instruction_Code(Instruction_Code));
always @(posedge clk or negedge reset)
begin
if(jump==1)
  PC<=extended;
else
begin
    if (reset==0)
        PC<=0;
    else if(stall==1)
        PC<=PC;
    else
        PC <= PC +4;
end
end
endmodule


