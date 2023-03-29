module moore_v2(
    input wire clk,
    input wire reset,
    input wire x,
    output reg y
);

    // States
    typedef enum logic [1:0] {
        A,
        B,
        C,
        D
    } state_t;

    // Registers
    state_t state_reg;
    
    // Combinational logic
    always_comb begin
        case(state_reg)
            A: y = 1'b0;
            B: y = x;
            C: y = 1'b0;
            D: y = ~x;
        endcase
    end

    // Sequential logic
    always_ff @(posedge clk, negedge reset) begin
        if (!reset) begin
            state_reg <= A;
        end else begin
            case(state_reg)
                A: state_reg <= x ? B : A;
                B: state_reg <= x ? D : C;
                C: state_reg <= x ? D : A;
                D: state_reg <= x ? C : B;
            endcase
        end
    end
endmodule
