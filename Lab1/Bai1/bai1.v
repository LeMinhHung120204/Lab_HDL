module mux2_1b (
	output m,
	input s, x, y
);
	assign m = s ? y : x;
endmodule 
// bai1b
module bai1 (
	output [7:0] m,
	input [7:0] x, y,
	input s
);
	mux2_1b m0(m[0], s, x[0], y[0]);
	mux2_1b m1(m[1], s, x[1], y[1]);
	mux2_1b m2(m[2], s, x[2], y[2]);
	mux2_1b m3(m[3], s, x[3], y[3]);
	mux2_1b m4(m[4], s, x[4], y[4]);
	mux2_1b m5(m[5], s, x[5], y[5]);
	mux2_1b m6(m[6], s, x[6], y[6]);
	mux2_1b m7(m[7], s, x[7], y[7]);
endmodule

