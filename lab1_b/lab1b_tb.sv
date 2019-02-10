/***************************************************************************
// *** ***
// *** EE 527 L Experiment #1 Christian Zamudio, Spring, 2019 ***
// *** ***
// *** Experiment #1 Verilog Coding and Simulation Review ***
// *** ***
// ***************************************************************************
// *** Filename: updownCounter_tb.sv Created by Christian Zamudio, Date 4-02-19
//*** --- revision history, if any, goes here --- ***
// ***************************************************************************//
`timescale 1 ns/1ns
module lab1b_tb;
 parameter COUNTER_SIZE = 16;
 parameter COUNTER_SIZE_2 = 32;

//declare dut input
 reg CLK;
 reg N_RST_1;
 reg N_RST_2;
 reg UP_DWN1;
 reg UP_DWN2;
 reg EN1;
 reg EN2;

 //declare dut outputs 
 wire[COUNTER_SIZE - 1: 0] COUNT;
 wire[COUNTER_SIZE_2 - 1:0] COUNT2;

//Instantiate DUT 

 lab1b dut( .CLK(CLK), .N_RST_1(N_RST_1), .N_RST_2(N_RST_2),  .EN_1(EN1), .EN_2(EN2), .UP_DWN1(UP_DWN1), .UP_DWN2(UP_DWN2), .COUNT1(COUNT1), .COUNT2(COUNT2)); //Name association

//Generate main clock for system
always #5 CLK = !CLK;

//Apply stimulus to the counter
initial begin
 N_RST_1 = 0; N_RST_2 = 0; UP_DWN1 = 0; UP_DWN2 =0; CLK = 0; EN1 = 0; EN2 = 0; //reset the counter for initial state
 #15 N_RST_1 = 1; N_RST_2=1; UP_DWN1 = 1; UP_DWN2 = 1; EN1 = 1; EN2 = 1; //release the system from reset
 #300 UP_DWN1 = 0; UP_DWN2 = 0; //Let counter saturateup and change direction
 #200 N_RST_1 = 0; N_RST_2 = 0; UP_DWN1 = 1; UP_DWN2 = 1; 
 #20 N_RST_1 = 1; N_RST_2 = 1;  //Start counter again 
 #400 UP_DWN1 = 0; UP_DWN2 = 0; //Change direction again
 #60 EN1 = 0; EN2= 0; //Disable counters
 #60 EN1 = 1; EN2 = 1;
 #350 $finish;
end

initial begin
 $monitor("time = %dns clk = %d n_rst1 = %d n_rst2 = %d en1 =%d en2 =%d  up_dwn1 = %d up_dwn2 = %d count1=%d count2= %d \n ", $time, CLK, N_RST_1, N_RST_2 , EN1, EN2, UP_DWN1, UP_DWN2,COUNT1,COUNT2); 
end
endmodule 
