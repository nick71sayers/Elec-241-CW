module task1a (input logic A, input logic B, input logic C, output logic P);  // define the logic

always @(A, B, C) //if these change
begin
	if (A == 0) && (B == 0) && (C == 0)        // test for each input
		P = 0;
	else if (A == 0) && (B == 0) && (C == 1)
		P = 1;
	else if (A == 0) && (B == 1) && (C == 0)
		P = 0;
	else if (A == 0) && (B == 1) && (C == 1)
		P = 0;
	else if (A == 1) && (B == 0) && (C == 0)
		P = 1;
	else if (A == 1) && (B == 0) && (C == 1)
		P = 1;
	else if (A == 1) && (B == 1) && (C == 0)
		P = 0;
	else if (A == 1) && (B == 1) && (C == 1)
		P = 0;
end
endmodule

module task1b(A, B, C, Q);         // in Dataflow

  input A, B, C;
  output Q;

  assign Q = (~A & ~B & ~C) | (~A & B & ~C) | (A & ~B & ~C) | (A & ~B & C);

endmodule
		