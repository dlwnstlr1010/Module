module Mealy_fsm_sequence_detector2 #( //1101
    parameter A = 0, B = 1, C = 2, D = 3
)(
    input clk, reset, data,
    output start_shifting);

    reg [1:0] state, next_state;
     
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    always @(state or data) begin
        case (state)
                A : next_state = data ? B : A;
                B : next_state = data ? C : B;
                C : next_state = data ? C : D;
                D : next_state = data ? B : A;
                default: next_state = A;
        endcase
    end

    always @(state or data) begin
        case (state)
                A : start_shifting = data ? 0 : 0;
                B : start_shifting = data ? 0 : 0;
                C : start_shifting = data ? 0 : 0;
                D : start_shifting = data ? 1 : 0;
        endcase
    end
endmodule