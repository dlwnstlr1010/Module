module four_bit_shift_register (
    input clk, areset, ena, load,
    input [3:0] data,
    output reg [3:0] q);

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            q <= 0;
        end
        else if(load) begin
            q <= data;
        end
        else if(ena) begin
            // q[3] <= 0;
            // q[2] <= data[3];
            // q[1] <= data[2];
            // q[0] <= data[1];
            // Data must be shifted within the q register, data must not be taken directly from the data array.
            q <= {1'b0, q[3:1]};
        end
    end
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module rotator (
    input clk, load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q);

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else begin
            case (ena)
            2'b01 : q <= {q[0], q[99:1]}; 
            2'b10 : q <= {q[98:0], q[99]}; 
            default : q <= q;
            endcase
        end
    end 
endmodule