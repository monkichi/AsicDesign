`timescale 1ns/1ns
module lab1b_100counters(CLK, N_RST, EN1, EN2, UPDWN1, UPDWN2, COUNTER1_OUT, COUNTER2_OUT);
//Parameters
parameter COUNTERS = 100; 
parameter COUNTER1_DATA_WIDTH = 16;
parameter COUNTER2_DATA_WIDTH = 32;

//inputs
input CLK;	//One main global clock
input N_RST;	//Global reset

input [COUNTERS -1 :0] EN1;	//Enable array for 1 counter
input [COUNTERS -1 :0] EN2;	//Enable array for 2nd counter

input [COUNTERS -1 :0] UPDWN1 ;  //Updown for Counter 1
input [COUNTERS -1 :0] UPDWN2;	//Updown for Counter 2

//outputs
output reg [COUNTER1_DATA_WIDTH - 1:0]  COUNTER1_OUT [COUNTERS-1:0];
output reg [COUNTER2_DATA_WIDTH - 1:0]  COUNTER2_OUT[COUNTERS-1:0];

genvar i;
generate
for(i=0; i<COUNTERS; i=i+1)
 //module lab1b( CLK, N_RST_1,N_RST_2, EN_1, EN_2,  UP_DWN1, UP_DWN2, COUNT1, COUNT2)//
 lab1b DUT (.CLK(CLK), .N_RST_1(N_RST), .N_RST_2(N_RST), .EN_1(EN1[i]), .EN_2(EN2[i]), .UP_DWN1(UPDWN1[i]), .UP_DWN2(UPDWN2[i]),.COUNT1(COUNTER1_OUT[i]), .COUNT2(COUNTER2_OUT[i])); 

endgenerate
endmodule
