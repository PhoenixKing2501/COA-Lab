`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:00:10 11/07/2022
// Design Name:   data_path
// Module Name:   /home/aerondight/COA Final Assignment/KGPminiRISC/data_path_2_tb.v
// Project Name:  KGPminiRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_path
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_path_2_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] reg_write;
	reg imm_mux_ctrl;
	reg alu_mux_ctrl;
	reg [3:0] alu_op;
	reg dmem_enable;
	reg dmem_write_enable;
	reg [1:0] reg_write_mux_ctrl;
	reg [4:0] br_op;

	// Outputs
	wire [31:0] instr_out;
	wire [5:0] opcode_out;
	wire [5:0] func_out;
	wire [31:0] res_out;
	wire [31:0] alu_res_out;
	wire [31:0] imm_res_out;

	// Instantiate the Unit Under Test (UUT)
	data_path uut (
		.clk(clk), 
		.rst(rst), 
		.reg_write(reg_write), 
		.imm_mux_ctrl(imm_mux_ctrl), 
		.alu_mux_ctrl(alu_mux_ctrl), 
		.alu_op(alu_op), 
		.dmem_enable(dmem_enable), 
		.dmem_write_enable(dmem_write_enable), 
		.reg_write_mux_ctrl(reg_write_mux_ctrl), 
		.br_op(br_op), 
		.instr_out(instr_out), 
		.opcode_out(opcode_out), 
		.func_out(func_out), 
		.res_out(res_out), 
		.alu_res_out(alu_res_out), 
		.imm_res_out(imm_res_out)
	);

	initial begin
		clk = 0;
		rst = 1;
		reg_write = 0;
		imm_mux_ctrl = 0;
		alu_mux_ctrl = 0;
		alu_op = 0;
		dmem_enable = 0;
		dmem_write_enable = 0;
		reg_write_mux_ctrl = 0;
		br_op = 0;

		// Wait 100 ns for global reset to finish
		#80 rst = 0;
		
		// xor $0, $0
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
				
		
		// addi $0, 121
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b1;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		// xor $1, $1
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
				
		// addi $1, 231
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b1;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
				
		// xor $2, $2
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		
		// addi $2, 21
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b1;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
				
	   // xor $3, $3
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		
		// addi $3, 45
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b1;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		

		// add $0, $1
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		
		// add $2, $3
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		
		// comp $0, $0
		#20	reg_write = 2'b01;
				alu_op = 4'b1;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		// xor $5, $5
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;
		
		
		// sw $0, 0($5)
		#20	reg_write = 2'b0;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				dmem_enable = 1;
				dmem_write_enable = 1;
				
		#20;
		
		// sw $1, 1($5)
		#20	reg_write = 2'b0;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				dmem_enable = 1;
				dmem_write_enable = 1'b1;
				
		
		#20;
			
		
		// lw $0, 0($5)
		#20	reg_write = 2'b10;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				dmem_enable = 1;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'b01;
				
		#20;
				
		
		// lw	$1, 1($5)
		#20	reg_write = 2'b10;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				dmem_enable = 1;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'b01;
				
		#20;
				
		
		// add $0, $2	
		#20	    reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;	
				
		#20;
		
		// Reset
		#20 	reg_write = 2'b0;
		

	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule





