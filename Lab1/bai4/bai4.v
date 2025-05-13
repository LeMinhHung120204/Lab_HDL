module mux2_1b(
	output m,
	input s, x, y
);
	assign m = (s) ? y : x;
endmodule 

module comparator(
	output y,
	input [3:0] x
);
	assign y = (x <= 4'd9) ? 0 : 1;
endmodule

module seg7_decode(
	output [6:0] HEX,
	input [3:0] sw
);
	assign HEX[0] = (~sw[3] & (sw[2] ~^ sw[0])) | (~sw[3] & sw[1]) | (sw[3] & ~sw[2] & ~sw[1]);
	assign HEX[1] = (~sw[3] & (sw[1] ~^ sw[0])) | ~(sw[3] | sw[2]) | ~(sw[2] | sw[1]);
	assign HEX[2] = (~sw[3] & sw[0]) | (~sw[3] & sw[2]) | ~(sw[2] | sw[1]);
	assign HEX[3] = (~sw[3] & ~sw[2] & sw[1]) | (~sw[3] & sw[2] & ~sw[1] & sw[0]) | (~sw[3] & sw[1] & ~sw[0]) | (sw[3] & ~sw[2] & ~sw[1]) | (~sw[3] & ~sw[2] & ~sw[0]);
	assign HEX[4] = (~sw[3] & sw[1] & ~sw[0]) | (~sw[2] & ~sw[1] & ~sw[0]);
	assign HEX[5] = (~sw[3] & sw[2] & ~sw[1]) | (~sw[3] & sw[2] & ~sw[0]) | (sw[3] & ~sw[2] & ~sw[1]) | (~sw[3] & ~sw[1] & ~sw[0]);
	assign HEX[6] = (~sw[3] & ~sw[2] & sw[1]) | (~sw[3] & sw[2] & ~sw[1]) | (sw[3] & ~sw[2] & ~sw[1]) | (~sw[3] & sw[1] & ~sw[0]);
endmodule

module A(
	input [2:0] x, 
	output reg [2:0] out
);
	always @(*)
		case (x)
			3'b010: out = 3'b000;
			3'b011: out = 3'b001;
			3'b100: out = 3'b010;
			3'b101: out = 3'b011;
			3'b110: out = 3'b100;
			3'b111: out = 3'b101;
			default: out = 3'b000;
		endcase
endmodule

module bai4(
	output [6:0] HEX1, HEX0,
	input [3:0] SW
);
	
	wire m3, m2, m1, m0, z;
	wire [2:0] x;
	
	comparator c0(z, SW);
	A tmp(SW[2:0], x);
	
	mux2_1b mu0 (m3, z, SW[3], 1'b0);
	mux2_1b mu1 (m2, z, SW[2], x[2]);
	mux2_1b mu2 (m1, z, SW[1], x[1]);
	mux2_1b mu3 (m0, z, SW[0], x[0]);
	
	seg7_decode seg0(HEX0, {m3, m2, m1, m0});
	seg7_decode seg1(HEX1, (z) ? 4'd1 : 4'd0);
	
endmodule 