//Build a four bit shifter with down counter
//Data is shifted in "most-significant-bit first" "when shift_ena is 1"
//The number currently in the shift register is decremented "when count_ena is 1."
module top_module (
    input clk, data,
    input shift_ena, count_ena,
    output [3:0] q);
    
    always @(posedge clk) begin
        if (shift_ena) begin
            q <= {data, q[3:1]};
        end
        if (count_ena) begin
            q <= q - 1'd1;
        end
    end
endmodule