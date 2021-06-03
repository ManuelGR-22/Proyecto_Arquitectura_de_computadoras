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
		/*3'b0: R = X + Y; //ADD...Aritmetica
		3'b1: R = X - Y; //SUB...Aritmetica
		3'b2: R = X & Y; //AND...Logica
		3'b3: R = X | Y; //OR...Logica
		3'b4: R = X < Y; //SLT...comparacion
		3'b5: R = X * Y; //Mul...Aritmetica
		3'b6: R = X / Y; //Div...Aritmetica
		3'b7: R = X << 0; //NOP
		3'b8: R = X << 0; //NOP*/
		3'd0: R = X + Y; //ADD
		3'd1: R = X - Y; //SUB
		3'd2: R = X & Y; //AND
		3'd3: R = X | Y; //OR
		3'd4: R = X < Y; //SLT
		3'd5: R = X * Y; //Mul
		3'd6: R = X / Y; //Div
		3'd7: R = X << 0; //NOP
		3'd8: R = X << 0; //NOP
		3'd9: R = X + Y;//addi
		3'd10: R = X < Y ;//slti...comparacion
		3'd11: R = X & Y;//andi...Logica
		3'd12: R = X | Y;//ori...Logica
		//3'd12: X = mem [Y + i]:4 //lw
		//3'd12: R <= X + Y[4];//lw...
		//3'd13: if (x ==y) goto R;//beq...
		//3'd13: if (X == Y) R += 1 << 2;
		default: R <= 32'bx;
	endcase

	Z_flag <=(R) ? 0:1;

end
endmodule
/*Instruction	Opcode/Function	Syntax	Operation
add	100000	f $d, $s, $t	$d = $s + $t
addi	001000	f $d, $s, i	$d = $s + SE(i)
and	100100	f $d, $s, $t	$d = $s & $t
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
