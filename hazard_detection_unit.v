`timescale 1ns / 1ps



module hazard_detection_unit(input MemRead_id_rr,input [4:0] rt_id_rr,
                            // input [4:0] rs,
                            // input [4:0] rt,
                             input [31:0] Instruction_code_IfId,
                             output reg stall);

always@(*)
begin
if(MemRead_id_rr==1)
  begin
    if( (Instruction_code_IfId[20:16]==rt_id_rr ) | (Instruction_code_IfId[25:21]==rt_id_rr) )
     begin
       stall<=1'b1;
     end
 end    
else
   stall<=1'b0;
end
endmodule