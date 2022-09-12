`timescale 1ns / 1ps

`include "CLA_add_1.v"

module counter(
	input clk,
	input reset,
	output reg [3:0] out
);
	
	always@(posedge clk or posedge reset) begin
	if (reset)
		out <= 0;
	else
		out <= out + 1;
	end

endmodule
