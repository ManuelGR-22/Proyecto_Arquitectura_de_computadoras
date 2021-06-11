`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module buffer3
	(
	//UNIDAD DE CONTROL
	//ENTRADAS
	//WB
	input INB3MemREG,
	input INB3RegWRITE,
	//M
	input INB3Branch,
	input INB3MemWRITE,
	input INB3MemRead,
	//RESTO
	input clk,
	input [31:0] inputAddB3,
	input Z_flag,
  	input [31:0] inputAddrst,
	input [31:0] inputRD2B3,
	input [4:0] inputmux,
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	output reg OTB3MemREG,
	output reg OTB3RegWRITE,
	//M
	output reg OTB3Branch,
	output reg OTB3MemWRITE,
	output reg OTB3MemRead,
	//RESTO
	output reg [31:0] outputAddB3,
	output reg [31:0] outputAddrst,
	output reg [31:0] outputRD2B3,
	output reg output_Z_flag,
	output reg [4:0] outputmux
	
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
		OTB3MemREG = INB3MemREG;
		OTB3RegWRITE = INB3RegWRITE;
		OTB3Branch = INB3Branch;
		OTB3MemWRITE = INB3MemWRITE;
		OTB3MemRead = INB3MemRead;
		outputAddB3 = inputAddB3;
		outputAddrst = inputAddrst;
		outputRD2B3 = inputRD2B3;
		outputmux = inputmux;
	end
endmodule
