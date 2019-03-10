//***************************************************************************
// *** ***
// *** EE 527 L Experiment #1 Christian Zamudiol, Spring, 2019 ***
// *** ***
// *** Experiment #1 Verilog Coding and Simulation Review ***
// *** ***
// ***************************************************************************
// *** Filename: updownCounter.sv Created by Christian Zamudio, Date 4-02-19
//*** --- revision history, if any, goes here --- ***
// ***************************************************************************//

`timescale 10ns / 10ns //Declare time scale for simulation timing/precision
module UpdownCounter(CLK,N_RST, EN, UP_DWN,COUNT);
//Paramater definition
parameter COUNTER_SIZE = 4;

//Declare inputs
input CLK;
input N_RST;
input UP_DWN; 
input EN;

//Declare outuputs
output reg [COUNTER_SIZE - 1 : 0 ] COUNT;

//Logic starts here
always_ff @(posedge CLK or negedge N_RST) begin //Had to change posedge to  negedge synthesis error 
 if(~N_RST)begin //changed!to~ due to synthesis error
  COUNT<= 0;
 end
 else begin
  if (EN)begin 
   if (UP_DWN) begin //Count up if UP_DWN = 1
     if(&COUNT) begin //Using reduction operator up saturation count 
      COUNT <= COUNT;
     end
    else begin
     COUNT <= COUNT + 1;
    end
   end
   else begin	     //Count down if UP_DWN = 0
    if(~| COUNT )begin //nor reduction for all 0's
     COUNT<= COUNT;
    end
    else begin
     COUNT<=COUNT- 1;
    end
   end
  end
  else begin
   COUNT <= COUNT;
  end
 end
end
endmodule 
