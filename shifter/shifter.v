module shifter (
    input clk, resetn, in,
    output out);

    reg [3:0] shift_register;

    always @(posedge clk) begin
        if (resetn) begin
            shift_register <= 0;
        end
        else begin
            shift_register <= {shift_register[3:1], in};
        end
    end

    assign out = shift_register[3]; 
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module nbits_shifter #(
    parameter N = 4
)(
    input clk,
    input resetn,
    input in,
    output out
);

    reg [N-1:0] shift_reg;  

    always @(posedge clk) begin
        if (!resetn) begin  
            shift_reg <= {N{1'b0}}; 
        end
        else begin
            shift_reg <= {shift_reg[N-2:0], in};  
        end
    end

    assign out = shift_reg[N-1];
endmodule