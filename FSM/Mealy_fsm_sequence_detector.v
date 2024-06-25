module Mealy_fsm_sequence_detector #( //101
    parameter A = 0, B = 1, C = 2
)(
    input clk, aresetn, x,
    output reg z);

    reg [1:0] state, next_state;

    //step1: initialize to state A and update present state
    always @(posedge clk or negedge aresetn) begin
        if(!aresetn) begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    //step2: determine next state
    always @(state or x) begin
        case (state)
            A : next_state = x ? B : A;
            B : next_state = x ? B : C;
            C : next_state = x ? B : A;
            default : next_state = A;
        endcase
    end

    //step3: evaluate output z
    always @(state or x) begin
        case (state)
            A : z = x ? 0 : 0;
            B : z = x ? 0 : 0; 
            C : z = x ? 1 : 0;
        endcase
    end
endmodule