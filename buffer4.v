`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module buffer4
	(
	//UNIDAD DE CONTROL
	//ENTRADAS
	//WB
	input INB4MemREG,
	input INB4RegWRITE,
	//RESTO
	input clk,
	input [31:0] inputDatmem,
  	input [31:0] inputAddrstB4,
	input [4:0] inputmuxB4,
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	output reg OTB4MemREG,
	output reg OTB4RegWRITE,
	//RESTO
	output reg [31:0] outputDatmem,
	output reg [31:0] outputAddrstB4,
	output reg [4:0] outputmuxB4
	);
	always @(posedge clk)
	begin
		OTB4MemREG = INB4MemREG;
		OTB4RegWRITE = INB4RegWRITE;
		outputDatmem = inputDatmem;
		outputAddrstB4 = inputAddrstB4;
		outputmuxB4 = inputmuxB4;
	end
endmodule
