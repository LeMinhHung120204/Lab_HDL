module c4_2(
	input clk_50, clr,
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);
	wire clk_1s;
	clk_1s c1(clk_50, clr, clk_1s);
	c4_1 c2(clk_1s, clr, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
endmodule 
