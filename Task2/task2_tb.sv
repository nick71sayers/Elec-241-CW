module task2_tb;

  parameter N = 10;

  logic CLK;
  logic n_RESET;
  logic n_OE;
  logic n_CEN;
  logic [15:0] Q;
  logic REL;

//module task2 #(parameter N=15) (output logic [N-1:0] Q,output logic REL,input logic n_OE,input logic n_CEN,input  logic CLK, input logic n_RESET,);
  task2 #(N) u1(.CLK(CLK), .n_RESET(n_RESET), .n_OE(n_OE), .n_CEN(n_CEN), .Q(Q) ,.REL(REL));

  initial begin
    CLK = 0;
    n_RESET = 0;
    n_OE = 0;
    n_CEN = 0;
    #10 n_RESET = 1;
    #10 n_OE = 1;
    #10 n_CEN = 1;
    repeat (20) @(posedge CLK);
    n_RESET = 0;
    repeat (30) @(posedge CLK);
    n_OE = 0;
    repeat (10) @(posedge CLK);
    n_OE = 1;
    repeat (10) @(posedge CLK);
    n_CEN = 0;
    repeat (20) @(posedge CLK);
    n_CEN = 1;
    repeat (30) @(posedge CLK);
	$finish;
  end

  always #5 CLK = ~CLK;

endmodule
