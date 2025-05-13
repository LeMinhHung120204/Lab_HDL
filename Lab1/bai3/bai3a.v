module mux2_1 (
	output wire m,
	input s, x, y
);
	assign m = s ? y : x;
endmodule

module mux5_1_1(
	output m,
	input [2:0] s,
	input u, v, w, x, y
);
	wire uv, wx, uvwx;
	mux2_1 m0(uv, s[0], u, v);
	mux2_1 m1(wx, s[0], w, x);
	mux2_1 m2(uvwx, s[1], uv, wx);
	mux2_1 m3(m, s[2], uvwx, y);
	
endmodule  

module mux5_1_3(
	output [2:0] m,
	input [2:0] s,
	input [2:0] u, v, w, x, y
);
	wire uv, wx, uvwx;
	mux5_1_1 m5110(m[0], s, u[0], v[0], w[0], x[0], y[0]);
	mux5_1_1 m5111(m[1], s, u[1], v[1], w[1], x[1], y[1]);
	mux5_1_1 m5112(m[2], s, u[2], v[2], w[2], x[2], y[2]);
	
endmodule 

// bai 3a
module bai3a(
	output [6:0] HEX0,
	input [2:0] c
);
	assign HEX0[0] = (~c[2] & ~c[1] & c[0]) | (c[2] & ~c[1] & ~c[0]);
	assign HEX0[1] = (~c[1] & ~c[0]);
	assign HEX0[2] = (~c[1] & ~c[0]);
	assign HEX0[3] = (~c[2] & c[0]) | (~c[2] & c[1]) | (c[2] & ~c[1] & ~c[0]);
	assign HEX0[4] = (~c[2]) | (~c[1] & ~c[0]);
	assign HEX0[5] = (~c[2]) | (~c[1] & ~c[0]);
	assign HEX0[6] = (~c[2] & ~c[1]);
endmodule 