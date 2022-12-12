`timescale 1ns / 1ps

module forwarding_unit(
    input [4:0] rs_rr_ex,
    input [4:0]rt_rr_ex,
    input [4:0] dstn_ex_mm,
    input RegWrite_ex_mm,
    input [4:0] dstn_mm_wb,
    input RegWrite_mm_wb,
    output reg [1:0] Forwarding_control_1,
    output reg [1:0] Forwarding_control_2   
        );

always @(*)
begin 
    if (RegWrite_ex_mm || RegWrite_mm_wb)
    begin
        if (dstn_ex_mm != 0 || dstn_mm_wb != 0 )
        begin
            if(dstn_ex_mm == rs_rr_ex)
            begin
                Forwarding_control_1 = 2'b01;
            end
            else if (dstn_mm_wb == rs_rr_ex)  
            begin
                Forwarding_control_1 = 2'b10;
            end
            else
            begin
                Forwarding_control_1 = 2'b00;
            end
            if(dstn_ex_mm ==rt_rr_ex)
            begin
                Forwarding_control_2 = 2'b01;
            end
            else if(dstn_mm_wb ==rt_rr_ex)
            begin
                Forwarding_control_2 = 2'b10;
            end
            else
            begin
                Forwarding_control_2 = 2'b00;
            end
        end             
     end
     else
     begin
           Forwarding_control_1 = 2'b00;
           Forwarding_control_2 = 2'b00;
     end
 end

endmodule



//module Forwarding_Unit(
//    input [4:0] ID_EX_Read_Reg_Num_1,
//    input [4:0] ID_EX_Read_Reg_Num_2,
//    input [4:0] EX_MEM_Write_Reg_Num,
//    input EX_MEM_RegWrite,
//    input [4:0] MEM_WB_Write_Reg_Num,
//    input MEM_WB_RegWrite,
//    output reg [1:0] Forwarding_control_1,
//    output reg [1:0] Forwarding_control_2   
//        );

//always @(*)
//begin 
//    if (EX_MEM_RegWrite | MEM_WB_RegWrite)
//    begin
//        if (EX_MEM_Write_Reg_Num != 0 | MEM_WB_Write_Reg_Num != 0 )
//        begin
//            if(EX_MEM_Write_Reg_Num == ID_EX_Read_Reg_Num_1)
//            begin
//                Forwarding_control_1 = 2'b01;
//            end
//            else if (MEM_WB_Write_Reg_Num == ID_EX_Read_Reg_Num_1)
//            begin
//                Forwarding_control_1 = 2'b10;
//            end
//            else
//            begin
//                Forwarding_control_1 = 2'b00;
//            end
//            if(EX_MEM_Write_Reg_Num == ID_EX_Read_Reg_Num_2)
//            begin
//                Forwarding_control_2 = 2'b01;
//            end
//            else if(MEM_WB_Write_Reg_Num == ID_EX_Read_Reg_Num_2)
//            begin
//                Forwarding_control_2 = 2'b10;
//            end
//            else
//            begin
//                Forwarding_control_2 = 2'b00;
//            end
//        end             
//     end
//     else
//     begin
//           Forwarding_control_1 = 2'b00;
//           Forwarding_control_2 = 2'b00;
//     end
// end

//endmodule