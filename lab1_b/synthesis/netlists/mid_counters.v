/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Mar 13 15:45:59 2019
/////////////////////////////////////////////////////////////


module lab1b ( CLK, N_RST_1, N_RST_2, EN_1, EN_2, UP_DWN1, UP_DWN2, COUNT1, 
        COUNT2 );
  output [15:0] COUNT1;
  output [31:0] COUNT2;
  input CLK, N_RST_1, N_RST_2, EN_1, EN_2, UP_DWN1, UP_DWN2;


  UpdownCounter_COUNTER_SIZE16 count1 ( .CLK(CLK), .N_RST(N_RST_1), .EN(EN_1), 
        .UP_DWN(UP_DWN1), .COUNT(COUNT1) );
  UpdownCounter_COUNTER_SIZE32 count2 ( .CLK(CLK), .N_RST(N_RST_2), .EN(EN_2), 
        .UP_DWN(UP_DWN2), .COUNT(COUNT2) );
endmodule

