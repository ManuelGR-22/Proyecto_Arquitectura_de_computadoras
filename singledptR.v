`timescale 1ns/1ns

module singledptR(
	input clk

);

	//BUFFER 1 IF/ID
	wire [31:0] inputAdd;
  	wire [31:0] inputInsMem;
	wire [31:0] outputAdd;
  	wire [31:0] OutputInsMem;
  	//BUFFER 2 ID/EX
  	//UNIDAD DE CONTROL
	//ENTRADAS
	//WB
	wire INB2MemREG;
	wire INB2RegWRITE;
	//M
	wire INB2Branch;
	wire INB2MemWRITE;
	wire INB2MemRead;
	//EX
	wire INB2RegDst;
	wire [2:0]INB2ALUOP;
	wire INB2ALUSrc;
	//RESTO
  	wire [31:0] inputRD1;
	wire [31:0] inputRD2;
	wire [31:0] inputSinex;
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	wire OTB2MemREG;
	wire OTB2RegWRITE;
	//M
	wire OTB2Branch;
	wire OTB2MemWRITE;
	wire OTB2MemRead;
	//EX
	wire OTB2RegDst;
	wire [2:0]OTB2ALUOP;
	wire OTB2ALUSrc;
	//RESTO
	wire [31:0] outputAddB2;
	wire [31:0] outputRD1;
	wire [31:0] outputRD2;
	wire [31:0] outputSinex;
	wire [4:0] outputRr1;
	wire [4:0] outputRr2;
  	//BUFFER 3 EX/MEM
	//RESTO
	wire [31:0] inputAddB3;
	wire Z_flag;
  	wire [31:0] inputAddrst;
	wire [4:0] inputmux;
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	wire OTB3MemREG;
	wire OTB3RegWRITE;
	//M
	wire OTB3Branch;
	wire OTB3MemWRITE;
	wire OTB3MemRead;
	//RESTO
	wire [31:0] outputAddB3;
	wire [31:0] outputAddrst;
	wire [31:0] outputRD2B3;
	wire output_Z_flag;
	wire [4:0] outputmux;
	//BUFFER 4 MEM/WB
	//RESTO
	wire [31:0] inputDatmem;
	//UNIDAD DE CONTROL
	//SALIDAS
	//WB
	wire OTB4MemREG;
	wire OTB4RegWRITE;
	//RESTO
	wire [31:0] outputDatmem;
	wire [31:0] outputAddrstB4;
	wire [4:0] outputmuxB4;
	//SIN BUFFER
	wire [31:0] PcInsMemYAdd;
	wire [31:0] MuxPc;
	wire [31:0] SL2Add;
	wire [31:0] MuxALU;
	wire [2:0] ALUCtrlALU;
	wire [31:0] MuxBR;
	wire PCSrc;

	buffer1 b1(clk,inputAdd,inputInsMem,outputAdd,OutputInsMem);

	buffer2 b2(INB2MemREG,INB2RegWRITE,INB2Branch,INB2MemWRITE,INB2MemRead,INB2RegDst,INB2ALUOP,INB2ALUSrc,clk,outputAdd,inputRD1,inputRD2,inputSinex,OutputInsMem[20:16],OutputInsMem[15:11],OTB2MemREG,OTB2RegWRITE,OTB2Branch,OTB2MemWRITE,OTB2MemRead,OTB2RegDst,OTB2ALUOP,OTB2ALUSrc,outputAddB2,outputRD1,outputRD2,outputSinex,outputRr1,outputRr2);

	buffer3 b3(OTB2MemREG,OTB2RegWRITE,OTB2Branch,OTB2MemWRITE,OTB2MemRead,clk,inputAddB3,Z_flag,inputAddrst,outputRD2,inputmux,OTB3MemREG,OTB3RegWRITE,OTB3Branch,OTB3MemWRITE,OTB3MemRead,outputAddB3,outputAddrst,outputRD2B3,output_Z_flag,outputmux);

	buffer4 b4(OTB3MemREG,OTB3RegWRITE,clk,inputDatmem,outputAddrst,outputmux,OTB4MemREG,OTB4RegWRITE,outputDatmem,outputAddrstB4,outputmuxB4);

	unit_control ucontrol(OutputInsMem[31:26],INB2MemREG,INB2RegWRITE,INB2MemWRITE,INB2Branch,INB2MemRead,INB2ALUSrc,INB2RegDst,INB2ALUOP);

	BankReg regb(OutputInsMem[25:21],OutputInsMem[20:16],outputmuxB4,OTB4RegWRITE,MuxBR,inputRD1,inputRD2);

	alu_ctrl aluctrl(outputSinex[5:0],OTB2ALUOP,ALUCtrlALU);

	insmemx insm(PcInsMemYAdd,inputInsMem);

	Suma_4b sumador(PcInsMemYAdd,32'd4,inputAdd);

	Suma_4b sumador2(outputAddB2,SL2Add,inputAddB3);

	pc pc(MuxPc,clk,PcInsMemYAdd);

	ALU operator(outputRD1,MuxALU,ALUCtrlALU,inputAddrst,Z_flag);

	mem_x memory(outputAddrst,outputRD2B3,OTB3MemWRITE,OTB3MemRead,inputDatmem);

	mux1 mux1(OTB2RegDst,outputRr1,outputRr2,inputmux);

	mux2 mux2(PCSrc,outputAddB3,inputAdd,MuxPc);

	mux2 mux3(OTB2ALUSrc,outputSinex,outputRD2,MuxALU);

	mux2 mux4(OTB4MemREG,outputDatmem,outputAddrstB4,MuxBR);

	MAnd andy(OTB3Branch,output_Z_flag,PCSrc);

	shiftL shift(outputSinex,SL2Add);

	signextend sign(OutputInsMem[15:0],inputSinex);

endmodule
