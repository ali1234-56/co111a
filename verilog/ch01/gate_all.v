module Nand (a, b, out);

    input a, b;
    output out;

    nand g0(out, a, b);

endmodule

module Not (in, out);

    input in;
    output out;

    Nand g0(in, in, out);

endmodule

module And (a, b, out);

    input a, b;
    output out;

    Nand g0(a, b, nab);
    Not  g1(nab, out);

endmodule

module Or (a, b, out);

    input a, b;
    output out;

    Nand g0(a, a, aa);
    Nand g1(b, b, bb);
    Nand g2(aa, bb, out);

endmodule

module Xor (a, b, out);

    input a, b;
    output out;
    
    Or g0(a, b, aorb);
    Nand   g1(a, b, anandb);
    And  g2(aorb, anandb, out);

endmodule

module Mux(a, b, sel, out);

    input a, b, sel;
    output out;

    Not g0(sel,sel2);
    And g1(a,sel2,c);
    And g2(b,sel,d);
    Or g3(c,d,out);

endmodule

module DMux(sel, out, a, b);

    input a, b, sel;
    output out;

    Not g0(sel,nsel);
    And g1(in,nsel,a);
    And g2(in,sel,b);

endmodule

module Not16(in,out);

    input [15:0]in;
    output [15:0]out;

    Not g0(in[0],out[0]);
    Not g1(in[1],out[1]);
    Not g2(in[2],out[2]);
    Not g3(in[3],out[3]);
    Not g4(in[4],out[4]);
    Not g5(in[5],out[5]);
    Not g6(in[6],out[6]);
    Not g7(in[7],out[7]);
    Not g8(in[8],out[8]);
    Not g9(in[9],out[9]);
    Not g10(in[10],out[10]);
    Not g11(in[11],out[11]);
    Not g12(in[12],out[12]);
    Not g13(in[13],out[13]);
    Not g14(in[14],out[14]);
    Not g15(in[15],out[15]);

endmodule

module And16(a,b,out);

    input [15:0]a,[15:0]b;
    output [15:0]out;

    And g0(a[0],b[0],out[0]);
    And g1(a[1],b[1],out[1]);
    And g2(a[2],b[2],out[2]);
    And g3(a[3],b[3],out[3]);
    And g4(a[4],b[4],out[4]);
    And g5(a[5],b[5],out[5]);
    And g6(a[6],b[6],out[6]);
    And g7(a[7],b[7],out[7]);
    And g8(a[8],b[8],out[8]);
    And g9(a[9],b[9],out[9]);
    And g10(a[10],b[10],out[10]);
    And g11(a[11],b[11],out[11]);
    And g12(a[12],b[12],out[12]);
    And g13(a[13],b[13],out[13]);
    And g14(a[14],b[14],out[14]);
    And g15(a[15],b[15],out[15]);

endmodule

module Or16(a,b,out);

    input [15:0]a,[15:0]b;
    output [15:0]out;

    Or g0(a[0],b[0],out[0]);
    Or g1(a[1],b[1],out[1]);
    Or g2(a[2],b[2],out[2]);
    Or g3(a[3],b[3],out[3]);
    Or g4(a[4],b[4],out[4]);
    Or g5(a[5],b[5],out[5]);
    Or g6(a[6],b[6],out[6]);
    Or g7(a[7],b[7],out[7]);
    Or g8(a[8],b[8],out[8]);
    Or g9(a[9],b[9],out[9]);
    Or g10(a[10],b[10],out[10]);
    Or g11(a[11],b[11],out[11]);
    Or g12(a[12],b[12],out[12]);
    Or g13(a[13],b[13],out[13]);
    Or g14(a[14],b[14],out[14]);
    Or g15(a[15],b[15],out[15]);

endmodule

module Mux16(a,b,sel,out);

    input [15:0]a,[15:0]b,sel;
    output [15:0]out;

    Mux g0(a[0],b[0],sel,out[0]);
    Mux g1(a[1],b[1],sel,out[1]);
    Mux g2(a[2],b[2],sel,out[2]);
    Mux g3(a[3],b[3],sel,out[3]);
    Mux g4(a[4],b[4],sel,out[4]);
    Mux g5(a[5],b[5],sel,out[5]);
    Mux g6(a[6],b[6],sel,out[6]);
    Mux g7(a[7],b[7],sel,out[7]);
    Mux g8(a[8],b[8],sel,out[8]);
    Mux g9(a[9],b[9],sel,out[9]);
    Mux g10(a[10],b[10],sel,out[10]);
    Mux g11(a[11],b[11],sel,out[11]);
    Mux g12(a[12],b[12],sel,out[12]);
    Mux g13(a[13],b[13],sel,out[13]);
    OMux g14(a[14],b[14],sel,out[14]);
    Mux g15(a[15],b[15],sel,out[15]);

endmodule

module Or8Way(in,out);

    input [7:0]in;
    output out;

    Or g0(in[0],in[1],out01);
    Or g1(in[2],in[3],out23);
    Or g2(in[4],in[5],out45);
    Or g3(in[6],in[7],out67);

    Or g4(out01,out23,out0123);
    Or g5(out45,out67,out4567);

    Or g6(out0123,out4567,out);


endmodule


module Mux4Way16(a,b,c,d,sel,out);

    input [15:0]a,[15:0]b,[15:0]c,[15:0]d,[1:0]sel;
    output [15:0]out;
    wire[15:0] e, f;

    Mux16 g1(a,b,sel[0],e);
    Mux16 g2(c,d,sel[0],f);

    Mux16 g3(e, f, sel[1], out);


endmodule

module Mux8Way16(a,b,c,d,e,f,g,h,sel,out);

    input [15:0]a,[15:0]b,[15:0]c,[15:0]d,[15:0]e,[15:0]f,[15:0]g,[15:0]h,[2:0]sel;
    output [15:0]out;
    wire[15:0] ab,cd,ef,gh,abcd,efgh;

    Mux16 g1(a,b,sel[0],ab);
    Mux16 g2(c,d,sel[0],cd);
    Mux16 g3(e,f,sel[0],ef);
    Mux16 g4(g,h,sel[0],gh);

    Mux16 g5(ab,cd,sel[1],abcd);
    Mux16 g6(ef,gh,sel[1],efgh);

    Mux16 g7(abcd,efgh,sel[2],out);


endmodule

module Dmux4Way(in,sel,a,b,c,d);

    input in,[1:0] sel;
    output a,b,c,d
    wire ao,bo;

    Dmux g1(in,sel[1],ao,bo);

    Dmux g2(ao,sel[0],a,b);
    Dmux g3(bo,sel[0],c,d);

endmodule

module Dmux8Way(in,sel,a,b,c,d,e,f,g,h);

    input in;
    output a,b,c,d,e,f,g,h;
    wire ao,bo,aoo,boo,coo,doo;

    DMux g0(in,sel[2],ao,bo);

    DMux g1(in,sel[1],aoo,boo);
    DMux g2(in,sel[1],coo,doo);

    DMux g3(in,sel[0],a,b);
    DMux g4(in,sel[0],c,d);
    DMux g5(in,sel[0],e,f);
    DMux g6(in,sel[0],g,h);

endmodule













