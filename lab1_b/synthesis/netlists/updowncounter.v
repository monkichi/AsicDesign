/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Mar 13 20:54:38 2019
/////////////////////////////////////////////////////////////


module UpdownCounter ( CLK, N_RST, EN, UP_DWN, COUNT );
  output [3:0] COUNT;
  input CLK, N_RST, EN, UP_DWN;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  FD2 \COUNT_reg[0]  ( .D(n22), .CP(CLK), .CD(N_RST), .Q(COUNT[0]), .QN(n6) );
  FD2 \COUNT_reg[1]  ( .D(n19), .CP(CLK), .CD(N_RST), .Q(COUNT[1]), .QN(n5) );
  FD2 \COUNT_reg[2]  ( .D(n20), .CP(CLK), .CD(N_RST), .Q(COUNT[2]), .QN(n4) );
  FD2 \COUNT_reg[3]  ( .D(n21), .CP(CLK), .CD(N_RST), .Q(COUNT[3]), .QN(n3) );
  IVP U21 ( .A(n15), .Z(n2) );
  AO2 U22 ( .A(n5), .B(COUNT[0]), .C(n6), .D(UP_DWN), .Z(n13) );
  ND2 U23 ( .A(EN), .B(n17), .Z(n15) );
  AO3 U24 ( .A(UP_DWN), .B(n3), .C(n13), .D(n18), .Z(n17) );
  AO2 U25 ( .A(COUNT[1]), .B(n4), .C(COUNT[2]), .D(n3), .Z(n18) );
  AO3 U26 ( .A(n5), .B(UP_DWN), .C(n2), .D(n13), .Z(n12) );
  AO7 U27 ( .A(n1), .B(n4), .C(n9), .Z(n20) );
  AO3 U28 ( .A(n10), .B(n11), .C(n4), .D(n2), .Z(n9) );
  IVP U29 ( .A(n12), .Z(n1) );
  NR3 U30 ( .A(COUNT[0]), .B(UP_DWN), .C(COUNT[1]), .Z(n10) );
  EN U31 ( .A(COUNT[1]), .B(n7), .Z(n19) );
  ND2 U32 ( .A(n8), .B(n2), .Z(n7) );
  EN U33 ( .A(COUNT[0]), .B(UP_DWN), .Z(n8) );
  AO4 U34 ( .A(n14), .B(n15), .C(n2), .D(n3), .Z(n21) );
  AO2 U35 ( .A(n11), .B(COUNT[2]), .C(COUNT[3]), .D(n16), .Z(n14) );
  ND3 U36 ( .A(n5), .B(n4), .C(n13), .Z(n16) );
  EN U37 ( .A(COUNT[0]), .B(n15), .Z(n22) );
  AN3 U38 ( .A(COUNT[0]), .B(UP_DWN), .C(COUNT[1]), .Z(n11) );
endmodule

