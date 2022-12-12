`timescale 1ns / 1ps

module instruction_memory(input [31:0] PC,input reset, output [31:0] Instruction_Code);
reg [7:0] Mem [36:0]; 
assign Instruction_Code= { Mem[PC],Mem[PC+1],Mem[PC+2],Mem[PC+3]};
always @(reset)
begin
    if (reset==0) 
    begin
        Mem[0] = 8'h8C;     Mem[1] = 8'h41;     Mem[2] = 8'h00;     Mem[3] = 8'h0A;
        Mem[4] = 8'hAC;     Mem[5] = 8'h61;     Mem[6] = 8'h00;    Mem[7] = 8'h05;
        Mem[8] = 8'h00;    Mem[9] = 8'hA3;    Mem[10] = 8'h10;    Mem[11] = 8'h25;
        Mem[12] = 8'h00;     Mem[13] = 8'hC7;     Mem[14] = 8'h08;     Mem[15] = 8'h25;
        Mem[16] = 8'h30;    Mem[17] = 8'h61;    Mem[18] = 8'h00;    Mem[19] = 8'h0A;
     //  Mem[20] = 8'h08;    Mem[21] = 8'h00;    Mem[22] = 8'h00;    Mem[23] = 8'h00;
       
       // Mem[16] = 8'h08;    Mem[17] = 8'h00;    Mem[18] = 8'h00;    Mem[19] = 8'h00;
       // Mem[20] = 8'h30;    Mem[21] = 8'h61;    Mem[22] = 8'h00;    Mem[23] = 8'h0A;
    end
end
endmodule