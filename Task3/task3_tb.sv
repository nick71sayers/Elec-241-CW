module moore_tb;

  reg clk;
  reg reset;
  reg x;
  wire y;

  moore_v1 u1(.clk(clk), .reset(reset), .x(x), .y(y));

  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    x = 0;

    // Wait a few clock cycles for initialization
    #10;

    // Test 1
    // Reset the state machine
    reset = 0;

    // Toggle X to trigger state transitions
    x = 1;
    #5;
    x = 0;
    #5;
    x = 1;
    #5;
    x = 1;
    #5;
    x = 0;
    #5;
    x = 1;
    #5;

    // End test
	$finish;
  end

  always #5 clk = ~clk;

endmodule
