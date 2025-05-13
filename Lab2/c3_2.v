module c3_2(
	input clk_50, clr,
	output [6:0] HEX
);
	wire clk_1s;
	clk_1s c0(clk_50, clr, clk_1s);
	
	c3_1 c1(clk_1s, clr, HEX);
endmodule 