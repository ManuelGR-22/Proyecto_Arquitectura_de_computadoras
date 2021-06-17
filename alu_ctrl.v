`timescale 1ns/1ns

module alu_ctrl(
	input[5:0] FUNCTION,
	input[2:0] ALUOP,
	output reg [2:0] OP
);

	always @(*) begin
		case (ALUOP)
			3'b010: begin
				case (FUNCTION)
				6'b100000: OP = 3'd0; //ADD
				6'b100010: OP = 3'd1; //SUB
				6'b100100: OP = 3'd2; //AND
				6'b100101: OP = 3'd3; //OR
				6'b101010: OP = 3'd4; //slt
				6'b011000: OP = 3'd5; //mul
				6'b011010: OP = 3'd6; //div
				6'b000000: OP = 3'd7; //nop
				endcase
			end
			3'b000: OP = 3'd0; //addi...
			3'b001: OP = 3'd4; //slti...
			3'b100: OP = 3'd2; //andi...
			3'b011: OP = 3'd3; //ori...
		endcase
	end
endmodule			
