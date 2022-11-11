`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group Members:
// Ritwik Ranjan Mallik (20CS10049)
// Utsav Basu (20CS30057) 
// 
// Create Date:    14:37:30 09/14/2022 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider (
	input clk_in,
	output reg clk_out
);

	reg [31:0] counter = 32'd0;
	parameter REDUCE = 32'd100_000;

	always @(posedge clk_in) begin
		counter <= counter + 32'd1;

		if (counter >= (REDUCE - 1))
			counter <= 32'd0;

		clk_out <= (counter < REDUCE / 2) ? 1'b0 : 1'b1;
	end

endmodule
