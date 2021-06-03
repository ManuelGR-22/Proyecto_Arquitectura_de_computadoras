`timescale 1ns/1ns
//1.Creacion del modulo 
module BankReg(
input[4:0] AR1, //Read Register 1
	input[4:0] AR2, //Read Register 2
	input[4:0] AW,  
	input REG_WRITE, //RegWrite
	input[31:0] DATAIN, //Write Data
	output reg [31:0] DR1, //Read data 1
	output reg [31:0] DR2  //Read data 2
);
reg [31:0] memory [0:31];
initial $readmemb("TestF1_BReg.txt",memory);

always @*
begin
//Antes de leer escribir a eso se refiere
	if(REG_WRITE) memory[AW] <= DATAIN;
	DR1 <= memory[AR1];
	DR2 <= memory[AR2];
end
endmodule
