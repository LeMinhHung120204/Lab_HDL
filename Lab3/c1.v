module c1(
	input x, clk, reset,
	output z
);
	parameter [4:0] s0 = 4'd0, s1 = 4'd1, s2 = 4'd2, s3 = 4'd3, s4 = 4'd4;
	parameter [4:0] t1 = 4'd5, t2 = 4'd6, t3 = 4'd7, t4 = 4'd8;

	reg [4:0] state, next_state;
	
	always @(*) begin
		case(state)
			s0 : next_state <= (x) ? s1 : t1;
			s1 : next_state <= (x) ? s2 : t1;
			s2 : next_state <= (x) ? s3 : t1;
			s3 : next_state <= (x) ? s4 : t1;
			s4 : next_state <= (x) ? s4 : t1;
			
			t1 : next_state <= (~x) ? t2 : s1;
			t2 : next_state <= (~x) ? t3 : s1;
			t3 : next_state <= (~x) ? t4 : s1;
			t4 : next_state <= (~x) ? t4 : s1;
			
			default: next_state <= s0;
		endcase
	end
	
	always @(posedge clk or negedge reset)
		if(~reset)
			state <= s0;
		else
			state <= next_state;
	
	assign z = (state == s4 | state == t4);
	
endmodule 