// bai 5c
module bai5(
	output Qa, Qb, Qc, Qan, Qbn, Qcn,
	input D, Clk
);
	bai5a a(Qa, Qan, D, Clk);
	bai5a b(Qb, Qbn, D, Clk);
	bai5a c(Qc, Qcn, D, ~Clk);
endmodule 