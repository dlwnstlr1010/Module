module BCD_adder (
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum);
    wire [2:0] x;

    bcd_fadd ba0(a[3:0], b[3:0], cin, x[0], sum[3:0]);
    bcd_fadd ba1(a[7:4], b[7:4], x[0], x[1], sum[7:4]);
    bcd_fadd ba2(a[11:8], b[11:8], x[1], x[2], sum[11:8]);
    bcd_fadd ba3(a[15:12], b[15:12], x[2], cout, sum[15:12]);
    
endmodule