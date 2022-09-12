`timescale 1ns / 1ps
`include "counter.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:27 09/09/2022
// Design Name:   counter
// Module Name:   C:/Users/Student/Desktop/Sem 5 Stuff/Week 5/counter/counter_tb.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		clk = 1'b0;
		repeat(100) #1 clk = !clk;
	end

	initial begin
			reset = 1'b1;
		#7  reset = 1'b0;
		#23 reset = 1'b1;
		#10 reset = 1'b0;
		#20 reset = 1'b1;
		#10 reset = 1'b0;
	end

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, counter_tb);
		$monitor("time=%d, reset=%d, c=%d", $time, reset, out);
	end

endmodule

