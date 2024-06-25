module four_bit_binary_counter (
    input clk, reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset)
        q <= 4'd0;
        else
        q <= q + 4'd1;
    end
endmodule

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

module Decade_counter (
    input clk, reset,
    output [3:0] q);

    always @(posedge clk) begin
        if(reset)
        q <= 4'd1;
        else if(q == 4'd10)
        q <= 4'd1;
        else
        q <= q + 4'd1;
    end
endmodule