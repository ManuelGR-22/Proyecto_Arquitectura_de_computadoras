`timescale 1ns/1ns

module mem_x(
	input[31:0] ADDR,
	input[31:0] DIN, //write data
	input EN_WR,
	input EN_RM,
	output reg [31:0] DOUT
);

reg [31:0] memory [0:31];

always @* begin
	if (EN_WR == 1) begin
		memory[ADDR] = DIN;
		DOUT = 32'bx;
	end

	if (EN_RM == 1) begin
		DOUT = memory[ADDR];
	end
end

endmodule
