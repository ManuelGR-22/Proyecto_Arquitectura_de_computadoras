`timescale 1ns/1ns

module shiftL(
	input [31:0] X,
	output [31:0] Y
);

assign Y = (X << 2);

endmodule