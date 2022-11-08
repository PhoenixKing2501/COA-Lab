`timescale 1ns / 1ps

module pc_incr_4 (
	input  [31:0] PC,
	output [31:0] PC_new
);

	assign PC_new = PC + 32'd4;
	
endmodule
