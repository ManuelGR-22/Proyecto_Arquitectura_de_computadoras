`timescale 1ns/1ns
//1.Creacion del modulo 
module Suma_4b(
	input  [31:0]X, //input Carry,
	input [31:0]Y,
	output [31:0]Suma //output Cout
);
//2.Declaraciones
	//N/A
//Cuerpo del modulo
// asignaciones
assign Suma = X + Y;
	
//instancias
	//N/A
//Bloques always (continuo)
	//N/A
endmodule					


