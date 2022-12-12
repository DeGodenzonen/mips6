`timescale 1ns / 1ps
module main_unit(input clk,input reset);


//fetch block
wire [31:0] wInstruction_code;
wire [31:0] wpc;
wire wstall;
wire [31:0] wextended;
wire wjump;

fetch a1( .clk(clk) ,.jump(wjump),.extended(wextended), .reset(reset) ,.stall(wstall), .Instruction_Code(wInstruction_code) , .PC(wpc)); 

//ifid register
wire [31:0] wInstruction_code_if_id;
wire [31:0] wpc_if_id;

If_Id a2( .Instruction_code(wInstruction_code) , .clk(clk) , .reset(reset) , .stall(wstall),.jump(wjump),
          .Instruction_code_IfId(wInstruction_code_if_id) , .PC(wpc) ,.PC_if_id(wpc_if_id));

// decode stage
wire [4:0] wrs;
wire [4:0] wrt;
wire [4:0]  wrd;
wire [4:0] wshamt;
wire [5:0] wfunct;

wire [5:0] wopcode;

decode a3(.Instruction_Code(wInstruction_code_if_id), .PC_if_id(wpc_if_id), .rs(wrs),.rt(wrt),.rd(wrd),.shamt(wshamt),
       .funct(wfunct),.extended(wextended) ,.opcode(wopcode));
 
 //MCU
wire wRegDst ;

wire wMemRead;
wire wMemWrite ;
wire wALUSrc;
wire  [1:0] wALUOp;
wire wMemtoReg;
wire wRegWrite;
        
                  
mcu   a4(.opcode(wopcode),.stall(wstall),.RegDst(wRegDst),.jump(wjump),.MemRead(wMemRead),.MemWrite(wMemWrite),
         .ALUSrc(wALUSrc),.ALUOp(wALUOp),.MemtoReg(wMemtoReg),.RegWrite(wRegWrite));

//id_rr register

wire [4:0] wrs_id_rr;
wire [4:0] wrt_id_rr;
wire [4:0] wrd_id_rr;
wire [4:0] wshamt_id_rr;
wire [5:0] wfunct_id_rr;
wire [31:0] wextended_id_rr;
wire wRegDst_id_rr ;
wire wjump_id_rr;
wire wMemRead_id_rr;
wire wMemWrite_id_rr ;
wire wALUSrc_id_rr;
wire  [1:0] wALUOp_id_rr;
wire wMemtoReg_id_rr;
wire wRegWrite_id_rr;


 Id_Rr a5(.clk(clk),.reset(reset),//.stall(wstall),
          .rs(wrs),.rs_id_rr(wrs_id_rr),.rt(wrt),.rt_id_rr(wrt_id_rr),
          .rd(wrd),.rd_id_rr( wrd_id_rr),.shamt(wshamt),.shamt_id_rr(wshamt_id_rr),.funct(wfunct),
          .funct_id_rr(wfunct_id_rr),.extended(wextended), .extended_id_rr(wextended_id_rr) ,
          //inputs of cntrols
          .RegDst(wRegDst),.jump(wjump),.MemRead(wMemRead),.MemWrite(wMemWrite),
          .ALUSrc(wALUSrc),.ALUOp(wALUOp),.MemtoReg(wMemtoReg),.RegWrite(wRegWrite),
          //output of controls
           .RegDst_id_rr(wRegDst_id_rr),.jump_id_rr(wjump_id_rr),
           .MemRead_id_rr(wMemRead_id_rr),.MemWrite_id_rr(wMemWrite_id_rr),. ALUSrc_id_rr(wALUSrc_id_rr),
           .ALUOp_id_rr(wALUOp_id_rr),.MemtoReg_id_rr(wMemtoReg_id_rr),.RegWrite_id_rr(wRegWrite_id_rr));
              
//reg_dstn mux
wire [4:0] wdstn;

regDst_mux a6(.rd_id_rr(wrd_id_rr),.rt_id_rr(wrt_id_rr) ,.RegDst_id_rr(wRegDst_id_rr), .dstn(wdstn));



//register file or read stage

wire [4:0] wdstn_mm_wb;  // from mm_wb register,               //these 2 should be declared in wb but i hae declared here to avoid errors
wire [31:0] wdatafrom_mm_wb;    //from writeback stage (mux)
wire [31:0] wRead_Data_1;  
wire [31:0] wRead_Data_2;
wire wRegWrite_mm_wb;    // FROM mm_wb register


registerfile a7(.Read_Reg_Num_1(wrs_id_rr),.Read_Reg_Num_2(wrt_id_rr),.Write_Reg_Num(wdstn_mm_wb),.Write_Data(wdatafrom_mm_wb),
                 .Read_Data_1( wRead_Data_1),.Read_Data_2( wRead_Data_2),.RegWrite_mm_wb(wRegWrite_mm_wb),.reset(reset));

//rr_ex register  
wire [31:0] wRead_Data_1_rr_ex;
wire [31:0] wRead_Data_2_rr_ex;
wire [4:0]  wdstn_rr_ex;
wire [31:0] wextended_rr_ex;
wire [5:0]  wfunct_rr_ex;
wire wALUSrc_rr_ex;
wire [1:0] wALUOp_rr_ex;
wire wMemtoReg_rr_ex;
wire wRegWrite_rr_ex;
wire wMemRead_rr_ex;
wire wMemWrite_rr_ex;
wire [4:0] wrs_rr_ex;
wire [4:0] wrt_rr_ex;


rr_ex a8(.clk(clk),.reset(reset),.Read_Data_1(wRead_Data_1),.Read_Data_1_rr_ex(wRead_Data_1_rr_ex),.Read_Data_2(wRead_Data_2),
         .Read_Data_2_rr_ex(wRead_Data_2_rr_ex),.dstn(wdstn),.dstn_rr_ex(wdstn_rr_ex),.extended_id_rr(wextended_id_rr),
         .extended_rr_ex(wextended_rr_ex),.ALUSrc_id_rr(wALUSrc_id_rr),.ALUSrc_rr_ex(wALUSrc_rr_ex),.ALUOp_id_rr(wALUOp_id_rr),.ALUOp_rr_ex(wALUOp_rr_ex),
         .MemtoReg_id_rr(wMemtoReg_id_rr),.MemtoReg_rr_ex(wMemtoReg_rr_ex),.RegWrite_id_rr(wRegWrite_id_rr),
         .RegWrite_rr_ex(wRegWrite_rr_ex),.MemRead_id_rr(wMemRead_id_rr),.MemRead_rr_ex( wMemRead_rr_ex),.MemWrite_id_rr( wMemWrite_id_rr),
         .MemWrite_rr_ex(wMemWrite_rr_ex),.funct_id_rr(wfunct_id_rr),.funct_rr_ex(wfunct_rr_ex),
         //forward
         .rs_id_rr(wrs_id_rr),.rt_id_rr(wrt_id_rr),.rs_rr_ex(wrs_rr_ex),.rt_rr_ex(wrt_rr_ex));

//forwarding unit

wire [1:0] wForwarding_control_1;
wire [1:0] wForwarding_control_2;
wire [4:0] wdstn_ex_mm; // input from ex mm stage,declared here because of warning
 
forwarding_unit a16(.rs_rr_ex(wrs_rr_ex),
                    .rt_rr_ex(wrt_rr_ex),
                    .dstn_ex_mm(wdstn_ex_mm),
                    .RegWrite_ex_mm(wRegWrite_mm_wb),
                    .dstn_mm_wb(wdstn_mm_wb),
                    .RegWrite_mm_wb(wRegWrite_mm_wb),
                    .Forwarding_control_1(wForwarding_control_1),
                    .Forwarding_control_2(wForwarding_control_2)); 
                    
//forwarding mux 1

wire [31:0] wfoutput1;
wire [31:0] wy_ex_mm;//input from y_ex_mm,declared here because of warning

forwarding_mux1  a17(.Forwarding_control_1(wForwarding_control_1),
                      .Read_Data_1_rr_ex(wRead_Data_1_rr_ex),
                      .y_ex_mm(wy_ex_mm),.datafrom_mm_wb(wdatafrom_mm_wb),.foutput1(wfoutput1));
                    
//forwarding mux 2

wire [31:0] wfoutput2;

forwarding_mux2 a18(.Forwarding_control_2(wForwarding_control_2),
                       .Read_Data_2_rr_ex(wRead_Data_2_rr_ex),
                        .y_ex_mm(wy_ex_mm),.datafrom_mm_wb(wdatafrom_mm_wb),
                        .foutput2(wfoutput2));

//alu_mux for second input

wire [31:0] wB;

 alu_mux a9(.foutput2(wfoutput2),.extended_rr_ex( wextended_rr_ex),.ALUSrc(wALUSrc_rr_ex),.B(wB));
 
 //alu control
 wire [3:0] wALU_Control;
 
  ALUControl a10( .ALU_Control(wALU_Control), .ALUOp(wALUOp_rr_ex), .functFeild(wfunct_rr_ex));
  
  //alu 
  wire [31:0] wy;
  
  alu a11(.A( wfoutput1),.B(wB),.acl(wALU_Control),.y(wy));
  
  //ex_mm 
 
  wire [31:0] wfoutput2_ex_mm;
  wire wMemRead_ex_mm;
  wire wMemWrite_ex_mm;
  wire wMemtoReg_ex_mm;
  wire wRegWrite_ex_mm;
  wire [4:0] wrs_ex_mm;
  wire [4:0] wrt_ex_mm;
  
  
  ex_mm a12(.clk(clk),.reset(reset),.dstn_rr_ex(wdstn_rr_ex),
               .dstn_ex_mm(wdstn_ex_mm),.y(wy), .y_ex_mm(wy_ex_mm),.foutput2(wfoutput2),   
               .foutput2_ex_mm(wfoutput2_ex_mm),.MemRead_rr_ex(wMemRead_rr_ex),.MemRead_ex_mm(wMemRead_ex_mm),.MemWrite_rr_ex(wMemWrite_rr_ex),
               . MemWrite_ex_mm(wMemWrite_ex_mm),.MemtoReg_rr_ex(wMemtoReg_rr_ex),.MemtoReg_ex_mm(wMemtoReg_ex_mm),.RegWrite_rr_ex(wRegWrite_rr_ex),
               .RegWrite_ex_mm(wRegWrite_ex_mm),
               .rs_rr_ex(wrs_rr_ex),.rt_rr_ex(wrt_rr_ex),.rs_ex_mm( wrs_ex_mm),. rt_ex_mm( wrt_ex_mm));
  
  
  
  //Data Memory
 wire [31:0] wdata;
  
Data_mem  a13(.address(wy_ex_mm),.MemRead_ex_mm(wMemRead_ex_mm),.MemWrite_ex_mm(wMemWrite_ex_mm),
              .foutput2_ex_mm(wfoutput2_ex_mm),.reset(reset),.data(wdata));



// mm_wb

wire [31:0] wy_mm_wb;
wire [31:0] wdata_mm_wb;
wire [4:0] wrs_mm_wb;
wire [4:0] wrt_mm_wb;

mm_wb a14(.clk(clk),.reset(reset),.RegWrite_ex_mm(wRegWrite_ex_mm),
          .RegWrite_mm_wb(wRegWrite_mm_wb),
          .MemtoReg_ex_mm(wMemtoReg_ex_mm),.MemtoReg_mm_wb(wMemtoReg_mm_wb),
          .y_ex_mm(wy_ex_mm),
          .y_mm_wb(wy_mm_wb),.data(wdata),.data_mm_wb(wdata_mm_wb),
          .dstn_ex_mm(wdstn_ex_mm),.dstn_mm_wb( wdstn_mm_wb),
          .rs_ex_mm( wrs_ex_mm),. rt_ex_mm( wrt_ex_mm),.rs_mm_wb(wrs_mm_wb),.rt_mm_wb(wrt_mm_wb));

// writeback

writeback a15(.MemtoReg_mm_wb(wMemtoReg_mm_wb),.y_mm_wb(wy_mm_wb),.data(wdata_mm_wb),.datafrom_mm_wb(wdatafrom_mm_wb));


//harzard detection unit
                            
hazard_detection_unit a20(.MemRead_id_rr(wMemRead_id_rr),.rt_id_rr(wrt_id_rr),
                         // .rs(wrs),
                          //.rt(wrt),
                          .stall(wstall),
                          .Instruction_code_IfId(wInstruction_code_if_id));                             
endmodule
