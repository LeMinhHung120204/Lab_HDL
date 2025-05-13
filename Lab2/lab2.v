module lab2(
	input clk, clr, enable, t,
	output p
);
	T_FF t1(clk, clr, enable, t, p);
endmodule 

module T_FF(
    input clk, clr, enable, t,
    output reg out
);
    always @(posedge clk or negedge clr) begin
        if (!clr) 
            out <= 1'b0;
        else if (enable) begin
				if(t)
					out <= ~out;
			end
    end
endmodule

module counterBCD(
	input clk, clr,
	output reg [3:0] q
);
	
	always @(posedge clk or negedge clr) begin
		if (!clr)
			q <= 4'd0;
		else if (q == 4'd9)
			q <= 4'd0;
		else
			q <= q + 1'b1;
	end
endmodule 

module clk_1s(
	input clk_50, clr,
	output reg clk_1s
);
	reg [24:0] count;
	always @(posedge clk_50 or negedge clr) begin
		if (!clr)
			clk_1s <= 1'b0;
		else if (count == 25000000) begin
			clk_1s <= ~clk_1s;
			count <= 0;
		end 
		else 
			count <= count + 1'b1;
	end
endmodule

module Led_cha(
	input [3:0] x,
	output reg [6:0] HEX
);
	always @(*) begin
		case(x)
			4'd0: HEX = 7'b1110110;
			4'd1: HEX = 7'b1111001;
			4'd2: HEX = 7'b0111000;
			4'd3: HEX = 7'b0111000;
			4'd4: HEX = 7'b0111111;
			default: HEX = 7'b0000000;
		endcase
	end
endmodule 

module Led_num(
	input [3:0] x,
	output reg [6:0] HEX 
);
	always @(*) begin
		case (x)
			4'd0: HEX = 7'b0111111;
			4'd1: HEX = 7'b0000110;
			4'd2: HEX = 7'b1011011;
			4'd3: HEX = 7'b1001111;
			4'd4: HEX = 7'b1100110;
			4'd5: HEX = 7'b1101101;
			4'd6: HEX = 7'b1111101;
			4'd7: HEX = 7'b0000111;
			4'd8: HEX = 7'b1111111;
			4'd9: HEX = 7'b1101111;
			default: HEX = 7'b0000000;
		endcase
	end
endmodule