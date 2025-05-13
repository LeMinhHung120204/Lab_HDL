module lab3(
	input x,
	output y
);
	assign y = x;
endmodule 

module clk_1s( 
 input clk_50, clr, 
 output reg clk_1s 
); 
	 reg [24:0] count; 
	 always @(posedge clk_50 or negedge clr) begin 
		if (!clr) 
			clk_1s <= 1'b0; 
		else if (count == 25000000 - 1) begin 
			clk_1s <= ~clk_1s; 
			count <= 0; 
		end  
		else  
			count <= count + 1'b1; 
	 end 
endmodule

module clk_500ms( 
 input clk_50, clr, 
 output reg clk 
); 
	 reg [24:0] count; 
	 always @(posedge clk_50 or negedge clr) begin 
		if (!clr) 
			clk <= 1'b0; 
		else if (count == 12500000 - 1) begin 
			clk <= ~clk; 
			count <= 0; 
		end  
		else  
			count <= count + 1'b1; 
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