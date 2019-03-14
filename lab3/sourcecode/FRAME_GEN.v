`timescale 1 ns / 1 ns
module FRAME_GEN(CLK, BIT_COUNT, PS_PATTERN, BIT_CNT_EN, PAT_GEN_EN, DMX_OUT);
  input CLK;
  input [5:0] BIT_COUNT;
  input PS_PATTERN;
  input BIT_CNT_EN;
  output PAT_GEN_EN;
  output DMX_OUT;
  reg DMX_OUT;
  reg PAT_GEN_EN;
  
  always @(posedge CLK) begin
    PAT_GEN_EN <= (BIT_COUNT > 39 && BIT_COUNT < 48) && BIT_CNT_EN;
    
    /*DMX 512 Frame generator
    26 bits of Logic 0: Space for Break
    Two bits of Logic 1: Mark after Break
    One start bit: logic 0
    Frame 0: packet is all zeros
    Two stop bits
    One start bit
    Eight bit data packet
    Two stop bits
    Repeat
    */
    if (BIT_COUNT < 26) DMX_OUT <= 1'b0;
    else if (BIT_COUNT < 28) DMX_OUT <= 1'b1;
    else if (BIT_COUNT < 37) DMX_OUT <= 1'b0;
    else if (BIT_COUNT < 39) DMX_OUT <= 1'b1;
    else if (BIT_COUNT < 40) DMX_OUT <= 1'b0;
    else if (BIT_COUNT < 48) DMX_OUT <= PS_PATTERN;
    else DMX_OUT <= 1'b1;
  end
  
endmodule
