`timescale 1ns / 1ps

module forwarding_mux2(input [1:0] Forwarding_control_2,input [31:0] Read_Data_2_rr_ex,
                        input [31:0] y_ex_mm, input [31:0] datafrom_mm_wb, output reg [31:0] foutput2);
    
always@(*)
begin
  case(Forwarding_control_2)
  
      2'b00:foutput2<=Read_Data_2_rr_ex;
      2'b01:foutput2<=y_ex_mm;
      2'b10:foutput2<=datafrom_mm_wb;
      default:foutput2<=Read_Data_2_rr_ex;
  endcase
end
endmodule

