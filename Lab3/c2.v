module c2(
	input clk_50, clr,
	output [6:0] HEX0, 
	output redNS, yellowNS, greenNS, redEW, yellowEW, greenEW,
	output [2:0] out
);
	
	parameter [2:0] s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4, s5 = 3'd5;
	wire clk;
	reg [2:0] count;
	clk_1s clk1(clk_50, clr, clk);

	reg [2:0] state, next_state;
	
	assign out = state;
	
	always @(posedge clk_50 or negedge clr) begin
		if (~clr)
			state <= s0;
		else
			state <= next_state;
	end
	
	always @(posedge clk_50 or negedge clr) begin
		if (~clr)
			count <= 3'd0;
		else begin
			/*if (count >= 5)
				count <= 3'd0;
			else if (count >= 3'd1 && (state == s1 || state == s2 || state == s4 || state == s5))
				count <= 3'd0;
			else
				count <= count + 1'b1;*/
			
			if(count >= 4)
				count <= 3'd0;
			if (state == s0 || state == s3)
				count <= count + 1'b1;
			
		end
	end

	
	
	always @(*) begin
		case(state)
			s0 : next_state = (count < 3'd4) ? s0 : s1;
			s1 : next_state = s2;
			s2 : next_state = s3;
			s3 : next_state = (count < 3'd4) ? s3 : s4;
			s4 : next_state = s5;
			s5 : next_state = s0;
			default next_state = s0;
		endcase
	end
	
	
	
	Led_num led0({1'b0, count}, HEX0);
	assign yellowNS = (state == s1) ? 1'b1 : 1'b0;
	assign greenNS = (state == s0) ? 1'b1 : 1'b0;
	assign redNS = (greenNS | yellowNS) ? 1'b0 : 1'b1;
	
	assign yellowEW = (state == s4) ? 1'b1 : 1'b0;
	assign greenEW = (state == s3) ? 1'b1 : 1'b0;
	assign redEW = (greenEW | yellowEW) ? 1'b0 : 1'b1;
	
endmodule 