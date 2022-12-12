module registerfile(
input [4:0] Read_Reg_Num_1,
input [4:0] Read_Reg_Num_2,
input [4:0] Write_Reg_Num,
input [31:0] Write_Data,
output reg [31:0] Read_Data_1, 
output reg [31:0] Read_Data_2,
input RegWrite_mm_wb,
input reset);

reg [31:0]regMeomry[31:0];

always @(*)
begin
    if (reset==0)
      begin
        regMeomry[0]= 32'd0; regMeomry[1]= 32'd0;
        regMeomry[2]= 32'd0; regMeomry[3]= 32'd3;
        regMeomry[4]= 32'd0; regMeomry[5]= 32'd5;
        regMeomry[6]= 32'd6; regMeomry[7]= 32'd7;
        regMeomry[8]= 32'd0; regMeomry[9]= 32'd0;
        regMeomry[10]= 32'd0; regMeomry[11]= 32'd0;
        regMeomry[12]= 32'd0; regMeomry[13]= 32'd0;
        regMeomry[14]= 32'd0; regMeomry[15]= 32'd0;
        regMeomry[16]= 32'd0; regMeomry[17]= 32'd0;
        regMeomry[18]= 32'd0; regMeomry[19]= 32'd0;
        regMeomry[20]= 32'd0; regMeomry[21]= 32'd0;
        regMeomry[22]= 32'd0; regMeomry[23]= 32'd0;
        regMeomry[24]= 32'd0; regMeomry[25]= 32'd0;
        regMeomry[26]= 32'd0; regMeomry[27]= 32'd0;
        regMeomry[28]= 32'd0; regMeomry[29]= 32'd0;
        regMeomry[30]= 32'd0; regMeomry[31]= 32'd0;
        regMeomry[32]= 32'd0;  
      end
   else
    begin
      if (RegWrite_mm_wb)
         regMeomry[Write_Reg_Num] <= Write_Data;
    end 
end

always @(*)    
begin
    Read_Data_1 <= regMeomry[Read_Reg_Num_1];
    Read_Data_2 <= regMeomry[Read_Reg_Num_2];  
     
end
endmodule