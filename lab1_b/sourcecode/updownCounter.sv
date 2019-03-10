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
module UP_DOWN_COUNTER(CLK,N_RST,LD,VALUE, EN, UP_DWN,COUNT);
//Paramater definition
parameter COUNTER_SIZE = 4;

//Declare inputs
input CLK;
input N_RST;
input UP_DWN; 
input EN;
input LD;
input [COUNTER_SIZE - 1 : 0] VALUE;


//Declare outuputs
output reg [COUNTER_SIZE - 1 : 0 ] COUNT;

//Logic starts here
always_ff@(posedge CLK or posedge N_RST) begin 
 if(!N_RST)begin
  COUNT<= 'b0;
 end//End of rst if
 else begin //start of rst else
  if (EN)begin
   if (!LD) begin //When ld != 1 count as normal
    if (UP_DWN) begin //Count up if UP_DWN = 1
     if(&COUNT) begin //Using reduction operator up saturation count 
       COUNT <= COUNT;
     end
     else begin
      COUNT <= COUNT + 1;
     end
    end //End of up/dwn if
    else begin	     //Count down if UP_DWN = 0
     if(~| COUNT )begin //nor reduction for all 0's
      COUNT<= COUNT;
     end
     else begin
      COUNT<=COUNT- 1;
     end//End of all zeros if statement
    end//End of up/dwn else
   end //end of ld if
   else begin 
    COUNT <= VALUE; //Load value into count register
   end//End of Load logic
  end //End of enable if
  else begin
   COUNT <= COUNT;
  end//End of enable if statement 
 end//End of reset if statement
end//End of always ff
endmodule 
