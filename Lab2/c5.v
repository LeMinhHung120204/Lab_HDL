module c5(
	input clk, clr,
	output [6:0] HEX0, HEX1
);
	
	reg [4:0] count;
	wire clk_1s;
	clk_1s c1 (clk, clr, clk_1s);
	always @(posedge clk or negedge clr) begin
		if (!clr)
			count <= 5'd0;
		else if (count == 5'd20)
			count <= 5'd0;
		else 
			count <= count + 5'd1;
	end
	
	wire [4:0] dv, chuc;
	assign dv = count % 5'd10;
	assign chuc = count / 5'd10;
	
	Led_num led0(dv[3:0], HEX0);
	Led_num led1(chuc[3:0], HEX1);
	
endmodule 