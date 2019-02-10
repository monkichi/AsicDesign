mescale 1 ns/1ns
module lab1b_tb;
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

//Instantiate DUT 

UP_DOWN_COUNTER dut (.CLK(CLK), .N_RST(N_RST), .EN(EN), .UP_DWN(UP_DWN), .COUNT(COUNT)); //Name association

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
