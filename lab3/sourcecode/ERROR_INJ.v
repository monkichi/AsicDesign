`timescale 1 ns / 1 ns
module ERROR_INJ(CLK, RST, EN, SWITCH, ERROR);
input CLK, RST, EN;
input [3:0] SWITCH;
output ERROR;
reg ERROR;
wire [3:0] COUNT1, COUNT2, COUNT3, COUNT4, COUNT5;

DEC_CNT C1(CLK, RST, EN, COUNT1);
DEC_CNT C2(CLK, RST, EN && COUNT1 == 4'd9, COUNT2);
DEC_CNT C3(CLK, RST, EN && COUNT1 == 4'd9 && COUNT2 == 4'd9, COUNT3);
DEC_CNT C4(CLK, RST, EN && COUNT1 == 4'd9 && COUNT2 == 4'd9 && COUNT3 == 4'd9, COUNT4);
DEC_CNT C5(CLK, RST, EN && COUNT1 == 4'd9 && COUNT2 == 4'd9 && COUNT3 == 4'd9 && COUNT4 == 4'd9, COUNT5);

always @(posedge CLK) begin
  case (SWITCH)
    //No periodic error injection. Push button switch can still be used to insert one at a time
    4'd0: ERROR <= 1'b0;
    //One in 1,000
    4'd1: if (EN && COUNT1 == 4'd9 && COUNT2 == 4'd9 && COUNT3 == 4'd9)
      ERROR <= 1'b1;
          else ERROR <= 1'b0;
    //One in 10,000
    4'd2: if (EN && COUNT1 == 4'd9 && COUNT2 == 4'd9 && COUNT3 == 4'd9 && COUNT4 == 4'd9)
            ERROR <= 1'b1;
          else ERROR <= 1'b0;
    //One in 100,000
    default: if (EN && COUNT1 == 4'd9 && COUNT2 == 4'd9 && COUNT3 == 4'd9 && COUNT4 == 4'd9 && COUNT5 == 4'd9)
            ERROR <= 1'b1;
          else ERROR <= 1'b0;
  endcase
end
endmodule