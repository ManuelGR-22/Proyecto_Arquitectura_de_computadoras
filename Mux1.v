`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module mux1(
	input MemTR,
	input [4:0] C5,
	input [4:0] C3,
	output reg [4:0] DW
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

always@*
begin
	case(MemTR)
		1'd1:
			DW = C3;//Escribir
		1'd0:
			DW = C5;//Leer

	endcase
end
endmodule

