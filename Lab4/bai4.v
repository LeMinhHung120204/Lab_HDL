module bai4 (
	input clock,
	input cs,
	input wr_e,
	input oe,
	input [6:0] addr,
	inout [7:0] data
);
	reg [7:0] mem [0:127];     // RAM 128 x 8-bit
	reg [7:0] data_out;

	always @(posedge clock) begin
		if (cs) begin
			if (wr_e) begin
				mem[addr] <= data;
			end 
			else begin
				data_out <= mem[addr];
			end
		end 
	end

	assign data = (oe) ? data_out : 8'bz;

endmodule
