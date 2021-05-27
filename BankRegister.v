`timescale 1ns/1ns

module BankReg(
	input[4:0] AR1, //Read Register 1
	input[4:0] AR2, //Read Register 2
	input[4:0] AW,  
	input REG_WRITE, //RegWrite
	input[31:0] DATAIN, //Write Data
	output reg [31:0] DR1, //Read data 1
	output reg [31:0] DR2  //Read data 2
);

reg [31:0] memoria [0:31];

initial begin
	$readmemb("TestF1_BReg.mem", memoria);
end

always @* begin
		DR1 = memoria[AR1];
		DR2 = memoria[AR2];

	if (REG_WRITE) memoria[AW] <= DATAIN;
		
end

endmodule
