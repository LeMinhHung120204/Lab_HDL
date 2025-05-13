// bai2b
module bai2(
	output [2:0] m,
	input [2:0] s,
	input [2:0] u, v, w, x, y
);
	wire uv, wx, uvwx;
	bai2a m5110(m[0], s, u[0], v[0], w[0], x[0], y[0]);
	bai2a m5111(m[1], s, u[1], v[1], w[1], x[1], y[1]);
	bai2a m5112(m[2], s, u[2], v[2], w[2], x[2], y[2]);
	
endmodule 
