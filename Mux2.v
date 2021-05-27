`timescale 1ns/1ns

module mux2(
	input MemTR,
	input [31:0] C5,
	input [31:0] C3,
	output reg [31:0] DW
);

always@*
begin
	case(MemTR)
		1'd1:
			DW = C5;
		1'd0:
			DW = C3;

	endcase
end
endmodule

