`include "diff.v"

`timescale 1ns / 1ps

module diff_tb;

	// Inputs
	reg [31:0] a,b;

	// Outputs
	wire [31:0] c;

	// Instantiate
	diff d1 (.inreg1(a), .inreg2(b), .out(c));

	initial begin
	
		$monitor("time = %0d, a = %d, b = %d, c = %d",
				$time, a, b, c);		
		
	end

	initial begin

		a = 0;
		b = 0;

		#100 
		a = 12;
		b = 34;
		
		#100 
		a = 78;
		b = 34;

		#100 
		a = 45;
		b = 90;

		#100 
		a = 16;
		b = 68;

		#100 
		a = 98;
		b = 34;

	end

	initial begin
		$dumpfile("diff.vcd");
		$dumpvars(0, diff_tb);
		#1000 $finish;
	end

endmodule

