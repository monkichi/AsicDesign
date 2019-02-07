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
`timescale 10ns/10ns
module updownCounter_tb;
 parameter COUNTER_SIZE = 2;
 parameter COUNTER_SIZE_2 = 4;

//declare dut input
 reg CLK;
 reg N_RST;
 reg UP_DWN;
 reg EN;

 //declare dut outputs 
 wire[COUNTER_SIZE - 1: 0] COUNT;
 wire[COUNTER_SIZE_2 - 1:0] COUNT2;

//Instantiate DUT with default parama

UP_DOWN_COUNTER #(COUNTER_SIZE) dut (.CLK(CLK), .N_RST(N_RST), .EN(EN), .UP_DWN(UP_DWN), .COUNT(COUNT)); //Name association

 //Instantiate another counter with different parameter size
UP_DOWN_COUNTER #(COUNTER_SIZE_2) dut2 (.CLK(CLK), .N_RST(N_RST), .EN(EN), .UP_DWN(UP_DWN), .COUNT(COUNT2)); //Name association


//Generate main clock for system
always #5 CLK = !CLK;

//Apply stimulus to the counter
initial begin
 N_RST = 0; UP_DWN = 0; CLK = 0; EN = 0; //reset the counter for initial state
 #15 N_RST = 1; UP_DWN = 1; EN = 1; //release the system from reset
 #300 UP_DWN = 0; //Let counter saturateup and change direction
 #200 N_RST = 0; UP_DWN = 1; 
 #20 N_RST = 1;  //Start counter again
 #400 UP_DWN = 0; //Change direction again
 #60 EN = 0; //Disable counters
 #60 EN = 1;
 #350 $finish;
end

initial begin
 $monitor("time = %dns clk = %d n_rst = %d en =%d up_dwn = %d count1=%d count2= %d \n ", $time, CLK, N_RST, EN, UP_DWN,COUNT,COUNT2); 
end
endmodule 
