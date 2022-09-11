`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:25 09/09/2022 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input clk,
    input reset,
	 output reg [3:0] out
    );
	 
	// input clk, reset;
	// output reg [3:0] out;
	
	always@(posedge clk) begin
	if (reset)
		out <= 0;
	else
		out <= out + 1;
	end

endmodule
