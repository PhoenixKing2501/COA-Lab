`timescale 1ns / 1ps

module program_counter (
	input [31:0] PC,
	input clk,
	input rst,
	output reg [31:0] PC_new
);

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			PC = -32'd0;
		end else begin
			PC = PC_new;
		end
	end
	
endmodule
