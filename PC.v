`timescale 1ns/1ns

module pc(
	input [31:0] X,
	input clk,
    output reg [31:0] pc
);

//reg [3:0] pc;
initial
    pc = 32'b0;

always@(posedge clk)
    begin
        if(X)
    	pc = X;
        else begin
                      pc = 0;
                  end          
    end
endmodule
