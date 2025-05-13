module bai1_tb;
	reg [31:0] A, B;
	reg M, S1, S0;
	wire [31:0] Y;

	bai1 uut (
	.A(A), .B(B),
	.M(M), .S1(S1), .S0(S0),
	.Y(Y)
	);

	initial begin
		$display("Time\tM S1 S0\tA\t\tB\t\tY");
		$monitor("%0t\t%b %b %b\t%h\t%h\t%h", $time, M, S1, S0, A, B, Y);

		A = 32'hAAAA_AAAA;
		B = 32'h5555_5555;

		{M, S1, S0} = 3'b000; #10; // Complement A
		{M, S1, S0} = 3'b001; #10; // AND
		{M, S1, S0} = 3'b010; #10; // XOR
		{M, S1, S0} = 3'b011; #10; // OR
		{M, S1, S0} = 3'b100; #10; // Decrement A
		{M, S1, S0} = 3'b101; #10; // Add
		{M, S1, S0} = 3'b110; #10; // Subtract
		{M, S1, S0} = 3'b111; #10; // Increment A

		#10 $finish;
	end
endmodule 