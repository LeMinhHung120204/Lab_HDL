module test(
	input CLOCK_50,
	input [4:0] SW,
	output [0:0] LEDR
);
	c3 cau3(
		.clk_50	(CLOCK_50),
		.clr		(SW[3]),
		.start	(SW[4]),
		.in		(SW[2:0]),
		.led		(LEDR)
	);
endmodule 