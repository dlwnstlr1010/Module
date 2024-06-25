// Moore Machine
// In the Moore machine, each state is assigned one output; therefore, parameterize it.
// The input only affects the state transition, and the current state determines the output.

module Moore_fsm #(parameter A = 0, B = 1)(
    input clk, areset, in,
    output reg out);

    reg state, next_state;

    //Set next state destination
    always @(*) begin
        case (state)
            B: next_state = in ? B : A;
            A: next_state = in ? A : B;
            default: next_state = B;
        endcase        
    end 

    //Change the current state itself (asynchronous reset)
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= B;
        end
        else begin
            state <= next_state;    
        end

        //After the status update, the output will be updated in the next clock cycle, which will increase the stability of the output, 
        //but may slow down the response rate.
        case (state)
            B: out <= 1;
            A: out <= 0; 
        endcase        
    end
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module Moore_fsm_jkFlipFlop #(
    parameter OFF = 0, ON = 1
)(
    input clk, reset, j, k,
    output reg out);

    reg state, next_state;

    //Set next state destination
    always @(*) begin
        case (state)
            OFF : next_state = j ? ON : OFF;
            ON : next_state = k ? OFF : ON;
            default : next_state = OFF;
        endcase
    end

    //Change the current state itself (synchronous reset)
    always @(posedge clk) begin
        if (reset) begin
            state <= OFF;
            out <= 0;
        end else begin
            state <= next_state;
            
            //The output also changes at the same time as the status update, 
            //which may result in faster reaction times, but may result in unexpected glitches depending on the design.
            case (next_state)
                OFF : out <= 0;
                ON : out <= 1;
            endcase
        end
    end
endmodule