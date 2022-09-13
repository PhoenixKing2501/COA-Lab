`timescale 1ns / 1ps

`include "counter.v"
`include "clock_divider.v"

module counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] out;
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)

	clock_divider c1(
		.clk_in(clk),
		.clk_out(clk_out)
	);

	counter uut (
		.clk(clk_out), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end

	initial begin
			reset = 1'b1;
		#7  reset = 1'b0;
		
	end

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, counter_tb);
		$monitor("time=%7d, c=%d", $time, out);

		// #120 $finish;
	end

endmodule

