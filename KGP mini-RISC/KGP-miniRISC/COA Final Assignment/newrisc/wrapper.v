`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:01 11/08/2022 
// Design Name: 
// Module Name:    wrapper 
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
module wrapper(
	input  clk,
	input  rst,
	input  t0,
	input  t1,
	input  t2,
	input  t3,
	input  t4,
	input  t5,
	input  t6,
	input  t7,
	input  t8,
	input  t9,
	output [15:0] res
);

//	assign res = 32'b0;

	reg [31:0] res1;
	
	KGPminiRISC uut (.clk(clk),.rst(rst));
	
//	assign res = uut.DataPath.pc[15:0];
	
//		
	always @(*) begin
		     if (t0) res1 = uut.DataPath.RegFile.reg_bank[20];
		else if (t1) res1 = uut.DataPath.RegFile.reg_bank[21];
		else if (t2) res1 = uut.DataPath.RegFile.reg_bank[22];
		else if (t3) res1 = uut.DataPath.RegFile.reg_bank[23];
		else if (t4) res1 = uut.DataPath.RegFile.reg_bank[24];
		else if (t5) res1 = uut.DataPath.RegFile.reg_bank[25];
		else if (t6) res1 = uut.DataPath.RegFile.reg_bank[26];
		else if (t7) res1 = uut.DataPath.RegFile.reg_bank[27];
		else if (t8) res1 = uut.DataPath.RegFile.reg_bank[28];
		else if (t9) res1 = uut.DataPath.RegFile.reg_bank[29];
		else         res1 = uut.DataPath.RegFile.reg_bank[31];
	end
	
	assign res = res1[15:0];
	
//	KGPminiRISC uut (.clk(clk),.rst(rst));


endmodule
