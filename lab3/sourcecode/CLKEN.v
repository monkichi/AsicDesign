/*Four bit counter to scale external 4 MHz clock to DMX
rate of 250 kHz.
Added to system April 30, 1009
*/
`timescale 1 ns / 1 ns
module CLKEN(CLK, RST, CLK_ENABLE);
  input CLK, RST;
  output CLK_ENABLE;
  reg CLK_ENABLE;
  reg [3:0] COUNT;
  
  always @(posedge CLK or negedge RST) begin
    if (!RST) COUNT <= 4'b0;
    else COUNT <= COUNT + 1;
  end
    
    always @(COUNT) CLK_ENABLE = COUNT == 4'd15;
  endmodule