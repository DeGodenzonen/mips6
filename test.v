`timescale 1ns / 1ps
module testbench();
reg reset;
reg clk;

main_unit tut (.clk(clk),.reset(reset));

initial begin
clk=0;
reset=0;
repeat(30)
#10 clk=~clk;
#10 $finish;
end
initial
begin
reset = 1;
#2 reset =0;
#5 reset=1;
end
endmodule