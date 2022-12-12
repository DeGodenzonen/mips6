module alu(A,B,acl,y); //a=read_data_1_rr_ex     b= output of alu_mux   acl=ALU_Control
input [31:0]  A,B;
input [3:0] acl;
output reg [31:0] y;
always@(A,B,acl)
begin
  case(acl)
     4'b0000: y=A&B;
     4'b0001: y=A|B;
     4'b0010: y= A+B;
     default: y=0;
   endcase  
end
endmodule