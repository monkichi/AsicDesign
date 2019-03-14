`timescale 1 ns / 1 ns
`define period 250
module tb_BER_TX;
  reg CLK, RST;
  reg PB1, PB2;
  reg [3:0] SWITCH;
  
    BER_TX  UUT(CLK, RST, PB1, PB2, SWITCH, DMX_OUT);
    
        initial begin
        CLK = 1'b0;
        forever #(`period/2) CLK = ~CLK;
      end
      
      initial begin
        #0 RST = 1'b1;
        #(2*`period) RST = 1'b0;
        #(2*`period) RST = 1'b1;
      end
      initial begin
        PB1 = 1'b0;
        PB2 = 1'b1;
        SWITCH = 4'd0;
        #(100*`period) PB2 = 1'b0;
        PB1 = 1'b1;
        #(100*`period) PB2 = 1'b1;
        PB1 = 1'b0;
      end
    endmodule