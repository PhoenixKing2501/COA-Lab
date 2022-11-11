`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:42 11/09/2022
// Design Name:   KGPminiRISC
// Module Name:   C:/Users/Student/Desktop/Sem 5 Stuff/COA Final Assignment/newrisc/full_tb_3.v
// Project Name:  newrisc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGPminiRISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_tb_3;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] final_res;

	// Instantiate the Unit Under Test (UUT)
	KGPminiRISC uut (
		.clk(clk), 
		.rst(rst), 
		.final_res(final_res)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100 rst = 0;
		
		
        
		// Add stimulus here

	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

