module mux8_1(
	input [2:0] sel, a, b, c, d, e, f, g, h,
	output reg [2:0] out
);
	always @(*)
		case(sel)
			3'b000: out = a;
			3'b001: out = b;
			3'b010: out = c;
			3'b011: out = d;
			3'b100: out = e;
			3'b101: out = f;
			3'b110: out = g;
			3'b111: out = h;
		endcase
endmodule 

module bai3d(
	input [2:0] sel,
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);
	wire [2:0] a, b, c, d, e, f, g, h;
	
	mux8_1 mux0(sel, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b010, 3'b100, a);
	mux8_1 mux1(sel, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b010, 3'b100, 3'b111, b);
	mux8_1 mux2(sel, 3'b111, 3'b000, 3'b001, 3'b010, 3'b010, 3'b100, 3'b111, 3'b111, c);
	mux8_1 mux3(sel, 3'b000, 3'b001, 3'b010, 3'b010, 3'b100, 3'b111, 3'b111, 3'b111, d);
	mux8_1 mux4(sel, 3'b001, 3'b010, 3'b010, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, e);
	mux8_1 mux5(sel, 3'b010, 3'b010, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, f);
	mux8_1 mux6(sel, 3'b010, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, g);
	mux8_1 mux7(sel, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b010, h);
	
	bai3a led7(HEX7, a);
	bai3a led6(HEX6, b);
	bai3a led5(HEX5, c);
	bai3a led4(HEX4, d);
	bai3a led3(HEX3, e);
	bai3a led2(HEX2, f);
	bai3a led1(HEX1, g);
	bai3a led0(HEX0, h);
	
endmodule 