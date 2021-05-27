`timescale 1ns/1ns

module unit_control(
	input[5:0] OPCODE,
	output reg MemREG, RegWRITE, MemWRITE,
	output reg Branch, MemRead, ALUSrc, RegDst,
	output reg [2:0] ALUOP
);

	always @* begin
		case (OPCODE)
			6'b000000: begin
				MemREG = 1;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 0;
				RegDst = 1;
				ALUOP = 3'b010;
			end
			default:
			begin
				MemREG = 1'bx;
				RegWRITE = 1'bx;
				MemWRITE = 1'bx;
				Branch = 1'bx;
				MemRead = 1'bx;
				ALUSrc = 1'bx;
				RegDst = 1'bx;
				ALUOP = 3'bx;
			end
		endcase
	end

endmodule
