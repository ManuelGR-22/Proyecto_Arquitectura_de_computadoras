`timescale 1ns/1ns
//1.Creacion del modulo 
//Declaracion del modulo con sus entradas y salidas 
module buffer2
	(
	//UNIDAD DE CONTROL
	//ENTRADAS
	//WB
	input INB2MemREG,
	input INB2RegWRITE,
	//M
	input INB2Branch,
	input INB2MemWRITE,
	input INB2MemRead,
	//EX
	input INB2RegDst,
	input [2:0]INB2ALUOP,
	input INB2ALUSrc,
	//RESTO
	input clk,
	input [31:0] inputAddB2,
  	input [31:0] inputRD1,
	input [31:0] inputRD2,
	input [31:0] inputSinex,
	input [4:0] inputRr1,
	input [4:0] inputRr2,
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	output reg OTB2MemREG,
	output reg OTB2RegWRITE,
	//M
	output reg OTB2Branch,
	output reg OTB2MemWRITE,
	output reg OTB2MemRead,
	//EX
	output reg OTB2RegDst,
	output reg [2:0]OTB2ALUOP,
	output reg OTB2ALUSrc,
	//RESTO
	output reg [31:0] outputAddB2,
	output reg [31:0] outputRD1,
	output reg [31:0] outputRD2,
	output reg [31:0] outputSinex,
	output reg [4:0] outputRr1,
	output reg [4:0] outputRr2
	);

	always @(posedge clk)
	begin
		OTB2MemREG = INB2MemREG;
		OTB2RegWRITE = INB2RegWRITE;
		OTB2Branch = INB2Branch;
		OTB2MemWRITE = INB2MemWRITE;
		OTB2MemRead = INB2MemRead;
		OTB2RegDst = INB2RegDst;
		OTB2ALUOP = INB2ALUOP;
		OTB2ALUSrc = INB2ALUSrc;
		outputAddB2 = inputAddB2;
		outputRD1 = inputRD1;
		outputRD2 = inputRD2;
		outputSinex = inputSinex;
		outputRr1 = inputRr1;
		outputRr2 = inputRr2;
	end
endmodule
