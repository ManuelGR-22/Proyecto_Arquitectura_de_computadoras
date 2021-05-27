`timescale 1ns/1ns

module singledptR(
	input clk

);

	wire MemREG, RegWRITE, MemWRITE, Branch, MemRead, ALUSrc, RegDst, Z_flag, Z;
	wire [2:0] ALUOP;
	wire [4:0] c13;
	wire [2:0] OP;
	wire [31:0] c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c14;

	unit_control ucontrol(c2[31:26], MemREG, RegWRITE, MemWRITE, Branch, MemRead, ALUSrc, RegDst, ALUOP);

	BankReg regb(c2[25:21], c2[20:16], c13, RegWRITE, c12, c3, c4);

	alu_ctrl_x aluctrl(c2[5:0], ALUOP, OP);

	insmemx insm(c1, c2);

	Suma_4b sumador (c1, 32'd4, c9);

	Suma_4b sumador2 (c9, c8, c10);

	pc pc(c11, clk, c1);

	alu_x operator (c3, c14, OP, c6, Z_flag);

	mem_x memory (c4, c6, MemWRITE, MemRead, c7);

	mux1 mux1 (RegDst, c2[15:11], c2[20:16], c13);

	mux2 mux2 (ALUSrc, c5, c4, c14);

	mux2 mux3 (Z, c10, c9, c11);

	mux2 mux4 (MemREG, c7, c6, c12);

	MAnd andy(Branch, Z_flag, Z);

	shiftL shift(c5, c8);

	signextend sign (c2[15:0], c5);

endmodule
