module c1_1(
	input clk, clr, enable,
	output [3:0] out
);
	wire tt3, tt2;
	assign tt3 = (out[2] & out[1] & out[0]);
	assign tt2 = (out[1] & out[0]);
	
	T_FF t0 (clk, clr, enable, tt3, out[3]);
	T_FF t1 (clk, clr, enable, tt2, out[2]);
	T_FF t2 (clk, clr, enable, out[0], out[1]);
	T_FF t3 (clk, clr, enable, 1'b1, out[0]);
endmodule 