module bai5b(
	output Qa, Qb,
	input D, Clk
);

	wire qm, tmp;
	bai5a master(qm, , D, ~Clk);
	bai5a slave(Qa, Qb, qm, Clk);
endmodule 