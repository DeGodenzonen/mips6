`timescale 1ns / 1ps

module forwarding_mux1(input [1:0] Forwarding_control_1,input [31:0] Read_Data_1_rr_ex,
                        input [31:0] y_ex_mm, input [31:0] datafrom_mm_wb, output reg [31:0] foutput1);

always@(*)
begin
  case(Forwarding_control_1)
  
      2'b00:foutput1<=Read_Data_1_rr_ex;
      2'b01:foutput1<=y_ex_mm;
      2'b10:foutput1<=datafrom_mm_wb;
      default:foutput1<=Read_Data_1_rr_ex;
  endcase
end
endmodule
