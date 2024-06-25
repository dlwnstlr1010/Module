module top_module #(
    parameter N = 100
)(
    input [N-1:0] a, b,
    input cin,
    output [N-1:0] cout,
    output [N-1:0] sum
);

    genvar i;
    wire [N-1:0] c; // Changed to N-1:0 to account for all intermediate carry outputs

    generate
        for (i = 0; i < N; i++) begin : adder
            if (i == 0)
                full_adder fa0(a[i], b[i], cin, c[i], sum[i]); // First adder uses cin and stores carry in c[i]
            else if (i == N-1)
                full_adder faf(a[i], b[i], c[i-1], cout, sum[i]); // Last adder uses the previous carry and outputs to cout
            else
                full_adder fan(a[i], b[i], c[i-1], c[i], sum[i]); // Middle adders chain the carry
        end
    endgenerate

endmodule

module full_adder(
    input a, b, cin,
    output cout, sum
);

    wire w1, w2, w3;
    assign w1 = a ^ b; // XOR for sum computation
    assign w2 = a & b; // AND for carry generation
    assign w3 = w1 & cin; // AND for propagated carry

    assign sum = w1 ^ cin; // Final sum calculation
    assign cout = w2 | w3; // Final carry output

endmodule
