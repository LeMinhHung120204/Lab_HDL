module c3(
	input clk_50, clr, start,
	input [2:0] in,
	output led
);
	
	parameter [3:0] s0 = 4'd0, dot1 = 4'd1, dot2 = 4'd2, dot3 = 4'd3, dot4 = 4'd4;
	parameter [3:0] dash1 = 4'd5, dash2 = 4'd6, dash3 = 4'd7, pause = 4'd8;
	
	reg [3:0] state, next_state, prev;
	reg [2:0] buffer;
	
	wire clk;
	clk_500ms clk1(clk_50, clr, clk);
	
	reg [2:0] count;
	
	always @(*) begin
	next_state = s0;
	
		case(state)
			s0: next_state = (~start) ? s0 :
									(in == 3'b000 || in == 3'b100 || in == 3'b101 || in == 3'b111) ? dot1 : dash1;
 			dot1, dot2, dot3, dot4, dash1, dash2, dash3: begin
				next_state = pause;
			end

			pause: begin
				case(buffer)
					3'b000: case(prev)
						s0: next_state = dot1;
						dot1: next_state = dash1;
						default: next_state = s0;
					endcase

					3'b001: case(prev)
						s0: next_state = dash1;
						dash1: next_state = dot1;
						dot1: next_state = dot2;
						dot2: next_state = dot3;
						default: next_state = s0;
					endcase

					3'b010: case(prev)
						s0: next_state = dash1;
						dash1: next_state = dot1;
						dot1: next_state = dash2;
						dash2: next_state = dot2;
						default: next_state = s0;
					endcase

					3'b011: case(prev)
						s0: next_state = dash1;
						dash1: next_state = dot1;
						dot1: next_state = dot2;
						default: next_state = s0;
					endcase

					3'b100: case(prev)
						s0: next_state = dot1;
						default: next_state = s0;
					endcase

					3'b101: case(prev)
						s0: next_state = dot1;
						dot1: next_state = dot2;
						dot2: next_state = dash1;
						dash1: next_state = dot3;
						default: next_state = s0;
					endcase

					3'b110: case(prev)
						s0: next_state = dash1;
						dash1: next_state = dash2;
						dash2: next_state = dot1;
						default: next_state = s0;
					endcase

					3'b111: case(prev)
						s0: next_state = dot1;
						dot1: next_state = dot2;
						dot2: next_state = dot3;
						dot3: next_state = dot4;
						default: next_state = s0;
					endcase
				endcase
			end

			default: next_state = s0;  
		endcase
		
	end

	always @(posedge clk or negedge clr) begin
		if(~clr)
			buffer <= 3'd0;
		else if(start)
			buffer <= in;
	end
	
	always @(posedge clk or negedge clr) begin
		if (~clr) begin
			count <= 3'd0;
			prev <= s0;
			state <= s0;
		end
		else begin
			if (state == s0)
				state <= next_state;
			else begin
				if(count >= 3) begin
					count <= 3'd0;
					prev <= state;
					state <= next_state;
				end
				else if (count >= 1 && (state == pause || state == dot1 || state == dot2 || state == dot3 || state == dot4)) begin
					count <= 3'd0;
					prev <= state;
					state <= next_state;
				end
				else count <= count + 1'b1;
				
			end
		end
	end
	
	assign led = (state != pause && state != s0) ? 1'b1 : 1'b0;
endmodule
