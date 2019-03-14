`timescale 1 ns / 1 ns
module DEBOUNCE(A, B, CLK, OUT);
  input A, B, CLK;
  output OUT;
  reg OUT;
  reg DB1, DB2, SYNC1, SYNC2, SYNC3;
  
  always @(A or B or DB1 or DB2) begin
    DB1 = ~(A && DB2);
    DB2 = ~(B && DB1);
  end
  
  always @(posedge CLK) begin
    SYNC1 <= DB1;
    SYNC2 <= SYNC1;
    SYNC3 <= SYNC2;
    OUT <= SYNC3 && !SYNC2;
  end
endmodule 
