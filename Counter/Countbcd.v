module BCD_counter (
    input clk, reset,
    output [3:1] ena,
    output [15:0] q );

    //processing enable signal, sequential logic is not suitable.
    //Enable signal is for real time, combinational logic is suitable. 
    always @(*) begin
        ena[1] = (q[3:0]==9) ? 1 : 0;
        ena[2] = (q[7:4]==9) && ena[1];
        ena[3] = (q[11:8]==9) && ena[2];
    end

    //For output, Synchronizing with clk is essential.
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end

        else begin 
            if(q[3:0]==9) begin
                q[3:0] <= 0;
            end
            else begin
                q[3:0] <= q[3:0] + 1;
            end

            if (ena[1]) begin
                if(q[7:4]==9) begin
                    q[7:4] <= 0;
                end
                else begin
                    q[7:4] <= q[7:4] + 1;
                end
            end

            if (ena[2]) begin
                if(q[11:8]==9) begin
                    q[11:8] <= 0;
                end
                else begin
                    q[11:8] <= q[11:8] + 1;
                end
            end
        end
    end
    
endmodule