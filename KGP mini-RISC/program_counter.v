`timescale 1ns / 1ps

module program_counter (
	input [31:0] PC_new,
	input clk,
	input rst,
	output [31:0] PC,
);

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			PC = 32'd0;
		end else begin
			PC = PC_new;
		end
	end
	
endmodule
