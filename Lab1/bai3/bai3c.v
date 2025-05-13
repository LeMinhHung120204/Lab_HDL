module bai3c(
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4,
	input [17:15] SW 
);

	wire [2:0] a, b, c, d, e;
	
	mux5_1_3 x1(a, SW, 3'b000, 3'b001, 3'b010, 3'b010, 3'b100);
	mux5_1_3 x2(b, SW, 3'b001, 3'b010, 3'b010, 3'b100, 3'b000);
	mux5_1_3 x3(c, SW, 3'b010, 3'b010, 3'b100, 3'b000, 3'b001);
	mux5_1_3 x4(d, SW, 3'b010, 3'b100, 3'b000, 3'b001, 3'b010);
	mux5_1_3 x5(e, SW, 3'b100, 3'b000, 3'b001, 3'b010, 3'b010);
	
	bai3a l1(HEX0, a);
	bai3a l2(HEX1, b);
	bai3a l3(HEX2, c);
	bai3a l4(HEX3, d);
	bai3a l5(HEX4, e);
endmodule 