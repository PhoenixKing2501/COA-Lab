`timescale 1ns / 1ps

`include "CLA_add_1.v"
`include "dff_block.v"

module counter(
	input clk,
	input reset,
	output wire [3:0] out
);

	wire [3:0] w1, w2;

	dff_block d1(
		.clk(clk),
		.reset(reset),
		.d(w1),
		.q(out)
		// .qb(w2[0])
	);

	// dff_block d2(
	// 	.clk(clk),
	// 	.reset(reset),
	// 	.d(w1[1]),
	// 	.q(out[1])
	// 	// .qb(w2[1])
	// );

	// dff_block d3(
	// 	.clk(clk),
	// 	.reset(reset),
	// 	.d(w1[2]),
	// 	.q(out[2])
	// 	// .qb(w2[2])
	// );

	// dff_block d4(
	// 	.clk(clk),
	// 	.reset(reset),
	// 	.d(w1[3]),
	// 	.q(out[3])
	// 	// .qb(w2[3])
	// );

	CLA_add_1 a1(
		.a(out),
		.s(w1)
	);

endmodule
