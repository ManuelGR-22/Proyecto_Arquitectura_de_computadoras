`timescale 1ns/1ns

module alu_x(	
	input [31:0] X,
	input [31:0] Y,
	input [2:0] SEL,
	output reg [31:0] R,
	output reg Z_flag
);

always@* begin
	case(SEL)
		3'd0: R = X + Y; //ADD
		3'd1: R = X - Y; //SUB
		3'd2: R = X & Y; //AND
		3'd3: R = X | Y; //OR
		3'd4: R = X < Y; //SLT
		3'd5: R = X << 0; //NOP
		3'd6: R = X * Y; //Mul
		3'd7: R = X / Y; //Div
		//3'd5: R <= X || Y;
		//3'd6: R <= X << 1;
		//3'd7: R <= X ^ Y;
		default: R <= 32'bx;
	endcase

	Z_flag <=(R) ? 0:1;

end
endmodule
