module c4_1(
	input clk, clr,
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);
	reg [3:0] count;
	always @(posedge clk or negedge clr) begin
		if (!clr)
			count <= 0;
		else if (count == 8)
			count <= 0;
		else 
			count <= count + 4'd1;
	end
	
	wire [3:0] tmp0, tmp1, tmp2, tmp3;
	assign tmp0 = (count <= 4'd4) ? count + 4'd1 :
						(count >= 4'd7) ? count - 4'd7 : 4'd5;
	assign tmp1 = (count <= 4'd3) ? count + 4'd2 :
						(count >= 4'd6) ? count - 4'd6 : 4'd5;
	assign tmp2 = (count >= 4'd5) ? count - 4'd5 :
						(count <= 4'd1) ? count + 4'd3 : 4'd5;
	assign tmp3 = (count >= 4'd4) ? count - 4'd4 :
						(count == 4'd0) ? count + 4'd4 : 4'd5;
						
	Led_cha led7 ((count >= 3) ? count - 4'd3 : 4'd5, HEX7);
	Led_cha led6 ((count >= 2) ? count - 4'd2 : 4'd5, HEX6);
	Led_cha led5 ((count >= 1) ? count - 4'd1 : 4'd5, HEX5);
	Led_cha led4 ((count == 8) ? 4'd0 : count, HEX4);
	Led_cha led3 (tmp0, HEX3);
	Led_cha led2 (tmp1, HEX2);
	Led_cha led1 (tmp2, HEX1);
	Led_cha led0 (tmp3, HEX0);
	
endmodule 