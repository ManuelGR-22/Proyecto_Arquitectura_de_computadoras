`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
//Definir constante E de 32 
module MUX#(parameter E = 32)
	(
	input MemTR,
	input [E-1:0] _0_in,
	input [E-1:0] _1_in,
	output reg [E-1:0] DW
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
//Bloques always (continuo)
	always @(*)
		begin
		
		//asignamiento bloqueante ya que si importa el oreden
		//de las asignaciones ya que las acciones se ejecutan de forma secuencial
			DW= 32'h00000000; //equivalencia a 32 bits en binario
			if(MemTR)
				begin
					DW = _1_in;//ESCRIBIR
				end
			else
				begin
					DW = _0_in;//LEER
				end
		end
endmodule
