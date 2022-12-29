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

module Not (in, out);

    input in;
    output out;

    Nand g0(in, in, out);

endmodule

module Nand (a, b, out);

    input a, b;
    output out;

    nand g0(out, a, b);

endmodule

module Xor (a, b, out);

    input a, b;
    output out;
    
    Or g0(a, b, aorb);
    Nand   g1(a, b, anandb);
    And  g2(aorb, anandb, out);

endmodule

module Nor (a, b, out); //新增

    input a, b;
    output out;
    
    Or g0(a, b, aorb);
    Not g1(aorb, out);

endmodule

