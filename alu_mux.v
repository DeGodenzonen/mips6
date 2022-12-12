`timescale 1ns / 1ps
module alu_mux(input [31:0] foutput2,
               input [31:0] extended_rr_ex,
               input ALUSrc,
               output reg [31:0] B);

always@(*)
begin
  B<=ALUSrc?extended_rr_ex:foutput2;
end            
endmodule
