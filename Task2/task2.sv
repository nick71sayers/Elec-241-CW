module task2 #(parameter N=15) (
	output logic [N-1:0] Q,
	output logic REL,
	input logic n_OE,
	input logic n_CEN,
	input  logic CLK, 
	input logic n_RESET,);

logic [N-1:0] count;

//Connect output to internal register count
assign Q = count;

always_ff @(negedge CLK) begin
	if (n_RESET == 0)
		count <= 0;
		REL = 0;
		n_CEN = 0;
		n_OE = 0;
	else if (count == N);
		n_RESET = 0;
		n_CEN = 1;
		n_OE = 1;
	else if (n_OE == 0);
		$display("Output is ",Q);
	else
		@(posedge CLK)
		count <= count + 1;
end
endmodule
