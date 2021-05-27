`timescale 1ns/1ns

module signextend(
	input [15:0] Signinp,
	output [31:0] extend
);

assign extend = {{16{Signinp[15]}}, Signinp};

endmodule