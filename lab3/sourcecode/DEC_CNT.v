`timescale 1 ns / 1 ns
module DEC_CNT(CLK, RST, EN, COUNT);
  input CLK, RST, EN;
  output [3:0] COUNT;
  reg [3:0] COUNT;
  
  always @(posedge CLK or negedge RST) begin
    if (!RST) COUNT <= 4'b0;
    else if (EN) begin
      if (COUNT == 4'd09) COUNT <= 4'b0;
      else COUNT <= COUNT + 1;
    end
    else COUNT <= COUNT;
  end
endmodule
