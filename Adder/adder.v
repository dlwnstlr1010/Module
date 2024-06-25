module half_adder (
    input a, b,
    output cout, sum);

    assign sum = a ^ b;
    assign cout = a & b;    
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

module full_adder(
    input a, b, cin,
    output cout, sum);

    wire w1, w2, w3;
    assign w1 = a ^ b;
    assign w2 = a & b;
    assign w3 = w1 & cin;

    assign sum = w1 ^ cin;
    assign cout = w2 | w3;
    
endmodule