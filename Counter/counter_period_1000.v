module top_module (
    input clk, reset,
    output reg [9:0] q);

    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            if(q == 10'd999) begin
                q <= 0;
            end
            else begin
                q <= q + 1;
            end
        end
    end
endmodule