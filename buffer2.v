`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module buffer2
	(
	input clk,
	input [31:0] inputAdd,
  	input [31:0] inputRD1,
	input [31:0] inputRD2,
	input [31:0] inputSinex,
	input [4:0] inputRr1,
	input [4:0] inputRr2,
	input [31:0] inputRd1,
	output reg [31:0] outputAdd,
	output reg [31:0] outputRD1,
	output reg [31:0] outputRD2,
	output reg [31:0] outputSinex,
	output reg [31:0] outputRr1,
	output reg [31:0] outputRr2,
  	output reg [31:0] outputInsRD1
	);
//declaracion de señales y variables 
	//NA
//2.Declaraciones
	//N/A
//3.Cuerpo del modulo--------
// asignaciones
	//NA	
//instancias
	//N/A
//Bloques always 
/*Deteccion de flanco: sirve para que un proceso solo se ejecute 
en determinados flancos de reloj de una o mas señales de entrada*/
//posedge detecta el flanco de subida
	always @(posedge clk)
	begin
		outputAdd = inputAdd;
		outputRD1 = inputRD1;
		outputRD2 = inputRD2;
		outputSinex = inputSinex;
		outputRr1 = inputRr1;
		outputRr2 = inputRr2;
		outputInsRD1 = outputInsRD1;
	end
endmodule
