`timescale 1ns / 1ps
module Data_mem(
input [31:0] address,  // alu output y must be connected here
input MemRead_ex_mm,
input MemWrite_ex_mm,
input [31:0] foutput2_ex_mm,  // Read_Data_2_ex_mm must be connected to this
input reset,
output reg [31:0] data
    );
    reg [7:0] dmem[39:0];
 always@(reset)
     begin
        dmem[0]<=8'd0;dmem[1] <= 8'd0;dmem[2]<= 8'd0;dmem[3]<=8'd0;
        dmem[4]<=8'd0;dmem[5]<=8'd0;dmem[6]<=8'd0;dmem[7]<=8'd0;
        dmem[8]<=8'd0;dmem[9]<=8'd0;dmem[10]<=8'd25;dmem[11]<=8'd0;
        dmem[12]<=8'd0;dmem[13]<=8'd0;dmem[14]<=8'd0;dmem[15]<=8'd0;
        dmem[16]<=8'd0;dmem[17]<=8'd0;dmem[18]<=8'd0;dmem[19]<=8'd0; 
        dmem[20]<=8'd0;dmem[21]<=8'd0;dmem[22]<=8'd0;dmem[23]<=8'd0;
       
    end
 
 
always@(*)
    begin    
        if(MemRead_ex_mm)
        begin    //memRead bit
            data  = {dmem[address],dmem[address+1],dmem[address+2],dmem[address+3]};
           
        end   
        if(MemWrite_ex_mm)
        begin    //memWrite bit
          {dmem[address],dmem[address+1],dmem[address+2],dmem[address+3]} = foutput2_ex_mm; 
         
        end     
    end
    

endmodule