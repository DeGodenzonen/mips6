`timescale 1ns / 1ps
module regDst_mux(input [4:0] rd_id_rr,input [4:0] rt_id_rr , input RegDst_id_rr, output reg [4:0] dstn); // all modules reqiring mcu signals has to input mcl of previous pipeline

always@(*)
begin
dstn<= RegDst_id_rr? rd_id_rr : rt_id_rr;
end
endmodule
