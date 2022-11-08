`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:04:57 11/07/2022
// Design Name:   KGPminiRISC
// Module Name:   /home/aerondight/COA Final Assignment/KGPminiRISC/full_tb_1.v
// Project Name:  KGPminiRISC
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

module full_tb_1;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] instr_out;
	wire [5:0] opcode;
	wire [5:0] func;
	wire [31:0] res_out;
	wire [31:0] alu_res_out;
	wire [31:0] imm_res_out;
	wire [31:0] pc;
	wire [31:0] pc_new;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [31:0] reg_val1;
	wire [31:0] reg_val2;
	wire [1:0] reg_write;
	wire imm_mux_ctrl;
	wire alu_mux_ctrl;
	wire [3:0] alu_op;
	wire dmem_enable;
	wire dmem_write_enable;
	wire [1:0] reg_write_mux_ctrl;
	wire [4:0] br_op;

	// Instantiate the Unit Under Test (UUT)
	KGPminiRISC uut (
		.clk(clk), 
		.rst(rst), 
		.instr_out(instr_out), 
		.opcode(opcode), 
		.func(func), 
		.res_out(res_out), 
		.alu_res_out(alu_res_out), 
		.imm_res_out(imm_res_out), 
		.pc(pc), 
		.pc_new(pc_new), 
		.rs(rs), 
		.rt(rt), 
		.reg_val1(reg_val1), 
		.reg_val2(reg_val2), 
		.reg_write(reg_write), 
		.imm_mux_ctrl(imm_mux_ctrl), 
		.alu_mux_ctrl(alu_mux_ctrl), 
		.alu_op(alu_op), 
		.dmem_enable(dmem_enable), 
		.dmem_write_enable(dmem_write_enable), 
		.reg_write_mux_ctrl(reg_write_mux_ctrl), 
		.br_op(br_op)
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

