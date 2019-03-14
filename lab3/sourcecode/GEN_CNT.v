/*Generic scalable counter

R. Mehler
December 2008
*/
`timescale 1 ns / 1 ns
module GEN_CNT(CLK, RST, EN, COUNT);
  parameter WIDTH = 4;
  input CLK, RST, EN;
  output [WIDTH - 1 : 0] COUNT;
  reg [WIDTH - 1 : 0] COUNT;
  
  always @(posedge CLK or negedge RST) begin
    if (!RST) COUNT <= 'b0;
    else begin
      if (EN) COUNT <= COUNT + 1;
      else COUNT <= COUNT;
    end
  end
endmodule