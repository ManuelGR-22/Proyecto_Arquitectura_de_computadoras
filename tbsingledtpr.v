`timescale 1ns/1ns

module tbsingled();
	reg clk;

singledptR datapath(clk);

always

	#100 clk = ~ clk;

initial
begin
	#10
	clk <= 0;
	#1200
	$stop;

end
endmodule