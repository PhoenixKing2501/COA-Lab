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
	 wire [1:0] reg_write = uut.reg_write;
	 wire imm_mux_ctrl = uut.imm_mux_ctrl;
	 wire alu_mux_ctrl = uut.alu_mux_ctrl;
	 wire [3:0] alu_op = uut.alu_op;
	 wire dmem_enable = uut.dmem_enable;
	 wire dmem_write_enable = uut.dmem_write_enable;
	 wire [1:0] reg_write_mux_ctrl = uut.reg_write_mux_ctrl;
	 wire [4:0] br_op = uut.br_op;
	 wire [5:0] opcode = uut.opcode;
	 wire [5:0] func = uut.func;

	// Instantiate the Unit Under Test (UUT)
	KGPminiRISC uut (
		.clk(clk), 
		.rst(rst) 
//		.instr_out(instr_out), 
//		.opcode(opcode), 
//		.func(func), 
//		.res_out(res_out), 
//		.alu_res_out(alu_res_out), 
//		.imm_res_out(imm_res_out), 
//		.pc(pc), 
//		.pc_new(pc_new), 
//		.rs(rs), 
//		.rt(rt), 
//		.reg_val1(reg_val1), 
//		.reg_val2(reg_val2), 
//		.reg_write(reg_write), 
//		.imm_mux_ctrl(imm_mux_ctrl), 
//		.alu_mux_ctrl(alu_mux_ctrl), 
//		.alu_op(alu_op), 
//		.dmem_enable(dmem_enable), 
//		.dmem_write_enable(dmem_write_enable), 
//		.reg_write_mux_ctrl(reg_write_mux_ctrl), 
//		.br_op(br_op)
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

