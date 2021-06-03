`timescale 1ns/1ns
module insmemx (
	input [31:0] Dir,
	output reg [31:0] instruction
);
reg[7:0] insMemory [0:399];

initial
	$readmemb("TestF2_MemInst.mem",insMemory);

always @*
begin
	
	instruction = {insMemory[Dir], insMemory[Dir+1], insMemory[Dir+2], insMemory[Dir+3]};

end
endmodule
