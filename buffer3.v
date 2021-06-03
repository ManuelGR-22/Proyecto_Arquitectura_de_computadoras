`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module buffer3
	(
	input clk,
	input [31:0] inputAdd,
  	input [31:0] inputAddrst,
	input [31:0] inputRD2,
	input [31:0] inputmux,
	output reg [31:0] outputAdd,
	output reg [31:0] outputAddrst,
	output reg [31:0] outputRD2,
	output reg [31:0] outputmux
	
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
		outputAddrst = inputAddrst;
		outputRD2 = inputRD2;
		outputmux = inputmux;
	end
endmodule
