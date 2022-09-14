`timescale 1ns / 1ps

`include "wrapper.v"

module counter_tb;

	reg clk;
	reg reset;

	wire [3:0] out;

	wrapper w1(
		.clk(clk),
		.rst(reset),
		.out(out)
	);

	initial begin
		clk = 1'b0;
		forever #7 clk = ~clk;
	end

	initial begin
			reset = 1'b1;
		#1  reset = 1'b0;
		
	end

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, counter_tb);
		$monitor("time=%7d, c=%d", $time, out);

		// #120 $finish;
	end

endmodule

