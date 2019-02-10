`timescale 1ns/1ns
module lab1b( CLK, N_RST_1,N_RST_2, EN_1, EN_2, UP_DWN1, UP_DWN2, COUNT1, COUNT2);
//declare parameters for two instances
 parameter COUNTER1_SIZE  = 16;
 parameter COUNTER2_SIZE = 32;

 //Declare inputs
 input CLK;

 input N_RST_1;
 input N_RST_2;

 input EN_1;
 input EN_2;

 input UP_DWN1;
 input UP_DWN2;

 //Declare outputs
 output reg [COUNTER1_SIZE - 1 : 0] COUNT1;
 output reg [COUNTER2_SIZE - 1 : 0] COUNT2;

 //Instantiate two counter modules
 UP_DOWN_COUNTER #(COUNTER1_SIZE) count1 (.CLK(CLK), .N_RST(N_RST_1), .EN(EN_1), .UP_DWN(UP_DWN1), .COUNT(COUNT1));
 UP_DOWN_COUNTER #(COUNTER2_SIZE) count2 (.CLK(CLK), .N_RST(N_RST_2), .EN(EN_2), .UP_DWN(UP_DWN2), .COUNT(COUNT2));


endmodule

