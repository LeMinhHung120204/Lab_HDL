module bai5a(
	output Qa, Qb,
	input D, Clk
);
	wire S_g, R_g;
	
	assign S_g = ~(D && Clk);
	assign R_g = ~(~D && Clk);
	
	assign Qa = ~(S_g && Qb);
	assign Qb = ~(R_g && Qa);
endmodule 