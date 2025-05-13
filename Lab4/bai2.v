module bai2 (
	input clk,
	input ReadWriteEn,
	input [4:0] ReadAddress1, ReadAddress2, WriteAddress,
	input [31:0] WriteData,
	output [31:0] ReadData1, ReadData2
);
	// 32 thanh ghi 32-bit
	reg [31:0] registers [31:0];

	always @(posedge clk) begin
		if (ReadWriteEn) begin
			registers[WriteAddress] <= WriteData;
		end
	end

	
	assign ReadData1 = registers[ReadAddress1];
	assign ReadData2 = registers[ReadAddress2];
endmodule
