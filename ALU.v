`timescale 1ns/1ns

module ALU(	
	input [31:0] X,
	input [31:0] Y,
	input [2:0] SEL,
	output reg [31:0] R,
	output reg Z_flag
);

always@* begin
	case(SEL)
	//R operando destino, X operando fuente 1,Y operando fuente 2
		3'd0: R = X + Y; //ADD ADDI LW SW
		3'd1: R = X - Y; //SUB BEQ
		3'd2: R = X & Y; //AND ANDI
		3'd3: R = X | Y; //OR ORI
		3'd4: R = X < Y; //SLT SLTI
		3'd5: R = X * Y; //Mul
		3'd6: R = X / Y; //Div
		3'd7: R = X << 0; //NOP
		default: R <= 32'bx;
	endcase

	Z_flag <=(R) ? 0:1;

end
endmodule
/*Instruction	Opcode/Function	Syntax	Operation
add				100000		f $d, $s, $t	$d = $s + $t
addi			001000		f $d, $s, i	$d = $s + SE(i)
and				100100		f $d, $s, $t	$d = $s & $t
andi	001100	f $d, $s, i	$t = $s & ZE(i)
div	011010	f $s, $t	lo = $s / $t; hi = $s % $t
mult	011000	f $s, $t	hi:lo = $s * $t
nor	100111	f $d, $s, $t	$d = ~($s | $t)
or	100101	f $d, $s, $t	$d = $s | $t
ori	001101	f $d, $s, i	$t = $s | ZE(i)


Comparison Instructions
Instruction	Opcode/Function	Syntax	Operation
slt	101010	f $d, $s, $t	$d = ($s < $t)
slti	001010	f $d, $s, i	$t = ($s < SE(i))

Branch Instructions
Instruction	Opcode/Function	Syntax	Operation
beq	000100	o $s, $t, label	if ($s == $t) pc += i << 2

Load Instructions
Instruction	Opcode/Function	Syntax	Operation
lw	100011	o $t, i ($s)	$t = MEM [$s + i]:4

Store Instructions
Instruction	Opcode/Function	Syntax	Operation
sw	101011	o $t, i ($s)	MEM [$s + i]:4 = $t*/
