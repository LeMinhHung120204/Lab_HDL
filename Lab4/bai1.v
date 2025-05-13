module bai1 (
	input [31:0] A, B,
	input M, S1, S0,
	output reg [31:0] Y
);
	always @(*) begin
		case ({M, S1, S0})
			3'b000: Y = ~A;		// Complement A
			3'b001: Y = A & B;	// AND
			3'b010: Y = A ^ B;	// EX-OR
			3'b011: Y = A | B;	// OR
			3'b100: Y = A - 1;	// Decrement A
			3'b101: Y = A + B;	// Add
			3'b110: Y = A - B;	// Subtract
			3'b111: Y = A + 1;	// Increment A
		default: Y = 32'b0;
		endcase
	end
endmodule
