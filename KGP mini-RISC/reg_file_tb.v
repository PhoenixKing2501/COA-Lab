`include "reg_file.v"

`timescale 1ns / 1ps

module register_file_tb;

	// Inputs
	reg [5:0] rs;
	reg [5:0] rt;
	reg [1:0] reg_write;
	reg [31:0] write_data;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] reg_val1;
	wire [31:0] reg_val2;

	// Instantiate the Unit Under Test (UUT)
	reg_file uut (
		.rs(rs), 
		.rt(rt), 
		.reg_write(reg_write), 
		.write_data(write_data), 
		.reg_val1(reg_val1), 
		.reg_val2(reg_val2), 
		.clk(clk), 
		.rst(rst)
	);

	always #2 clk = ~clk;

	initial begin
	
		$monitor("time = %0d, clk = %d, rs = %d, rt = %d, reg_val1 = %d, reg_val2 = %d", $time, clk, rs, rt, reg_val1, reg_val2);
			
		// Initialize Inputs
		rs = 0;
		rt = 0;
		reg_write = 0;
		write_data = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 0;

		// Add stimulus here
		rs = 6'd1;
		reg_write = 2'b01;
		write_data = 32'd16;

		#4;

		rt = 6'd2;
		reg_write = 2'b10;
		write_data = 32'd22;

		#4;

		rs = 6'd1;
		rt = 6'd2;
		reg_write = 2'b00;
		write_data = 32'd10;

		#4;

		rs = 6'd1;
		reg_write= 2'b01;
		write_data = 32'd9;

	end

	initial begin
		#1000 $finish;
	end
      
endmodule
