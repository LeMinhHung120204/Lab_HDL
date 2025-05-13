module c2_2(
	input clk, clr, enable,
	output [7:0] out
);
	c2_1 #(.width(8)) c2(clk, clr, enable, out);
endmodule 