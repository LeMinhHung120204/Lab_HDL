module c3_1(
	input clk, clr,
	output [6:0] HEX
);
	wire [3:0] a;
	counterBCD bcd0(clk, clr, a);
	
	Led_num led0(a, HEX);
endmodule 