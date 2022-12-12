module ALUControl( ALU_Control, ALUOp, functFeild);  
 output reg[3:0] ALU_Control;  
 input [1:0] ALUOp;  
 input [5:0] functFeild;  
 wire [7:0] ALUControlIn;  
 assign ALUControlIn = {ALUOp,functFeild};  
 always @(ALUControlIn)  
 casex (ALUControlIn)  
  8'b11xxxxxx: ALU_Control=4'b0000;  //andi
  8'b00XXXXXX: ALU_Control=4'b0010;  //adding for lw  and sw  
  8'b10100101: ALU_Control=4'b0001;  //or
  default: ALU_Control=4'b0000;  
  endcase  
 endmodule