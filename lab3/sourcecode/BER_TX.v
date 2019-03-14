/*Top level of BER Transmitter

Uses 2**16 - 1 pseudo-random pattern generator on channel
1 of a BER frame. Channel 0 is all zeros.
No other channels are transmitted.

By R. Mehler
California State University Northridge

Intial Release
December 2008
*/
`timescale 1 ns / 1 ns
module BER_TX(CLK, RST, PB1, PB2, SWITCH, DMX_OUT);
  input CLK, RST;
  input PB1, PB2;
  input [3:0] SWITCH;
  output DMX_OUT;
  wire DMX_OUT;
  wire PAT_GEN_EN;
  wire [3:0] CLK_COUNT;
  wire [5:0] BIT_COUNT;
  
  DEBOUNCE  DEBOUNCE(PB1, PB2, CLK, SINGLE);
  ERROR_INJ ERROR_INJ(CLK, RST, PAT_GEN_EN, SWITCH, ERROR);
  GEN_CNT   CLK_CNT(CLK, RST, 1'b1, CLK_COUNT);
  GEN_CNT   #(.WIDTH(6)) BIT_CNT (CLK, RST, CLK_COUNT == 4'd15, BIT_COUNT);
  PAT_GEN   PAT_GEN(CLK, RST, PAT_GEN_EN, SINGLE, ERROR, PS_PATTERN);
  FRAME_GEN FRAME_GEN(CLK, BIT_COUNT, PS_PATTERN, CLK_COUNT == 4'd15, PAT_GEN_EN, DMX_OUT);
  endmodule
