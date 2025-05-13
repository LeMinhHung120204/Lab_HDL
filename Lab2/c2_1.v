module c2_1 #(
	parameter width = 4
)(
	input clk, clr, enable,
	output reg [width - 1 : 0] out
);
	
	always @(posedge clk) begin
		if(!clr)
			out <= 4'd0;
		else if(enable)
			out <= out + 4'd1;
	end
endmodule 