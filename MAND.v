`timescale 1ns/1ns
//1.Declaracion de Moudlo y Puertos I/0
module MAnd(
	input X,
	input Y,
	output Z
);
//2.Declaracion de seniales o Reg 
//NA

//3.cuerpo del Modulo
         //asgnacion continua
assign Z = X & Y;

endmodule