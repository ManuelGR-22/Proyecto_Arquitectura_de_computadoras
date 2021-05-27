`timescale 1ns/1ns

module mux1(
	input MemTR,
	input [4:0] C5,
	input [4:0] C3,
	output reg [4:0] DW
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
