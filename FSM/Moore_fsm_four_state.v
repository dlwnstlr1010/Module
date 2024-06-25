module Moore_fsm_four_state #(
    parameter A=0, B=1, C=2, D=3
)(
    input in,
    input clk,
    input areset,
    output out);

    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
            default: next_state = A;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
        end
        else begin
           state <= next_state;
        end
        case (state)
                A : out <= 0;
                B : out <= 0;
                C : out <= 0;
                D : out <= 1;
            endcase 
    end 
endmodule