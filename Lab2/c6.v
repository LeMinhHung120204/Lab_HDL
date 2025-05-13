module c6(
	input clk_50, clr, load,
	input [4:0] h,
	input [5:0] m,
	output [6:0] HEX0, HEX1, HEX2, HEX3,
	output fault
);
	
	assign fault = (h >= 5'd24 | m >= 6'd60) ? 1'b1 : 1'b0;
	
	wire clk_1s;
	reg [5:0] count_s, count_m;
	reg [4:0] count_h;
	
	clk_1s c0 (clk_50, clr, clk_1s);
	
	always @(posedge clk_50 or negedge clr) begin
		if(!clr) begin
			count_m <= 6'd0;
			count_s <= 6'd0;
			count_h <= 5'd0;
		end 
		else begin
			if (load && !fault) begin
				 count_m <= m;
				 count_s <= 6'd0;
				 count_h <= h;
			end
			else if(count_s == 6'd59) begin
				count_s <= 6'd0;
				count_m <= count_m + 6'd1;
				
				if (count_m == 6'd60) begin
					count_h <= count_h + 5'd1;
					count_m <= 6'd0;
					if (count_h == 5'd24)
						count_h <= 5'd0;
				end
			end 
			else 
				count_s <= count_s + 6'd1;
		end
	end
	
	wire [3:0] chuc_m, dv_m, chuc_h, dv_h;
	
	assign chuc_m = count_m / 10,
				dv_m = count_m % 10;
	assign chuc_h = count_h / 10,
				dv_h = count_h % 10;
				
	Led_num l0(chuc_h, HEX0);
	Led_num l1(dv_h, HEX1);
	Led_num l2(chuc_m, HEX2);
	Led_num l3(dv_m, HEX3);
endmodule 