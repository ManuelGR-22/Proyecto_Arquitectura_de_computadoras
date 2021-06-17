`timescale 1ns/1ns

module unit_control(
	input[5:0] OPCODE,
	output reg MemREG, RegWRITE, MemWRITE,
	output reg Branch, MemRead, ALUSrc, RegDst,
	output reg [2:0] ALUOP
);

	always @* begin
		case (OPCODE)
			6'b000000: begin //TIPO R
				MemREG = 0;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 0; 
				RegDst = 1;
				ALUOP = 3'b010; 
			end
			6'b100011: begin //lw
				MemREG = 1;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 1;
				ALUSrc = 1;
				RegDst = 0;
				ALUOP = 3'b000;
			end
			6'b101011: begin //sw
				MemREG = 1'bx;
				RegWRITE = 0;
				MemWRITE = 1;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 1;
				RegDst = 1'bx;
				ALUOP = 3'b000;
			end	
			6'b000100: begin //beq
				MemREG = 1'bx;
				RegWRITE = 0;
				MemWRITE = 0;
				Branch = 1;
				MemRead = 0;
				ALUSrc = 0;
				RegDst = 1'bx;
				ALUOP = 3'b000;
			end
			6'b001000: begin //ADDI
				MemREG = 0;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 1; //1 TIPO I
				RegDst = 0;
				ALUOP = 3'b000; //dependende de cada op
			end
			6'b001100: begin //ANDI
				MemREG = 0;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 1; //1 TIPO I
				RegDst = 0;
				ALUOP = 3'b100; //dependende de cada op
			end
			6'b001101: begin //ORI
				MemREG = 0;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 1; //1 TIPO I
				RegDst = 0;
				ALUOP = 3'b011; //dependende de cada op
			end
			6'b001010: begin //SLTI
				MemREG = 0;
				RegWRITE = 1;
				MemWRITE = 0;
				Branch = 0;
				MemRead = 0;
				ALUSrc = 1; //1 TIPO I
				RegDst = 0;
				ALUOP = 3'b001; //dependende de cada op
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
