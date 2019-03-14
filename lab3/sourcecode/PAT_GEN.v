/*BER pattern generator. Implements a 2**16 - 1 linear feedback
shift register. Implementation is in Galois form rather than the
more common Fibonacci as Galois has only one gate delay per stage.
XNOR operators are used to allow the LFSR to be intialized to zero.

Error injection is done by inverting the data bit in response to a
push button. The error signal is debounced and synchronized but must
be held in this module until used.

Author: R. Mehler
California State University Northridge

Initial Release
December 2008

Revision History

*/
`timescale 1 ns / 1 ns
module PAT_GEN(CLK, RST, EN, SINGLE, ERROR, DOUT);
  input CLK, RST, EN;
  input SINGLE, ERROR;
  output DOUT;
  reg DOUT;
  reg INJECT;
  reg [15:0] LFSR;
  
  always @(posedge CLK) begin
    if (ERROR || SINGLE) INJECT <= 1'b1;
    else if (EN) INJECT <= 1'b0;
    else INJECT <= INJECT;
      
    if (INJECT) DOUT <= ~LFSR[15];
    else DOUT <= LFSR[15];   
  end
  
  always @(posedge CLK or negedge RST) begin
    if (!RST) LFSR <= 16'h0;
    else begin
      if (EN) begin
        LFSR[9:0] <= LFSR[10:1];
        LFSR[10] <= LFSR[11] ~^ LFSR[0];
        LFSR[11] <= LFSR[12];
        LFSR[12] <= LFSR[13] ~^ LFSR[0];
        LFSR[13] <= LFSR[14] ~^ LFSR[0];
        LFSR[14] <= LFSR[15];
        LFSR[15] <= LFSR[0];
      end
      else
        LFSR <= LFSR;
    end
  end
endmodule
