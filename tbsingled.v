`timescale 1ns/1ns

module tbsingled();
	reg clk;

singledptR datapath(clk);

always

	#50 clk = ~ clk;

initial
begin
	clk <= 0;
	#7500
	$stop;

end
endmodule
