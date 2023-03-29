module moore_v1 (
    input logic clk, // clock input
    input logic rst, // asynchronous reset input
    input logic x,   // input signal
    output logic y   // output signal
);

    // Define state enumeration
    typedef enum logic [2:0] {
        STATE_0,
        STATE_1,
        STATE_2,
        STATE_3,
        STATE_4,
        STATE_5
    } state_t;

    // Define state and output registers
    state_t curr_state, next_state;
    logic y_reg;

    // Define state transition logic
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            curr_state <= STATE_0;
            y_reg <= 1'b0;
        end
        else begin
            curr_state <= next_state;
            y_reg <= (curr_state == STATE_5) ? 1'b1 : 1'b0;
        end
    end

    // Define state/output transition logic
    always_comb begin
        case (curr_state)
            STATE_0: begin
                next_state = x ? STATE_2 : STATE_1;
            end
            STATE_1: begin
                next_state = x ? STATE_3 : STATE_1;
            end
            STATE_2: begin
                next_state = x ? STATE_4 : STATE_1;
            end
            STATE_3: begin
                next_state = x ? STATE_0 : STATE_5;
            end
            STATE_4: begin
                next_state = x ? STATE_0 : STATE_5;
            end
            STATE_5: begin
                next_state = x ? STATE_0 : STATE_0;
            end
        endcase
    end

    // Assign output
    assign y = y_reg;

endmodule
