module moore_compare;

  reg clk;
  reg reset;
  reg x;

  wire y_v1;
  wire y_v2;

  // Instantiate the DUTs
  moore_v1 u1(clk, reset, x, y_v1);
  moore_v2 u2(clk, reset, x, y_v2);

  // Initialize Inputs
  initial begin
    clk = 0;
    reset = 1;
    x = 0;

    // Reset the DUTs
    #5 reset = 0;

    // Test each input sequence
    repeat (10) begin
      #5 x = ~x;
    end

    // End the simulation
    #5 $finish;
  end

  // Toggle the clock
  always #1 clk = ~clk;

  // Display the outputs
  always @(posedge clk) begin
    $display("x=%b y_v1=%b y_v2=%b", x, y_v1, y_v2);
  end

endmodule
