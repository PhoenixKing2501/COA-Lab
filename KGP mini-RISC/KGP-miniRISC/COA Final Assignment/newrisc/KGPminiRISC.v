`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:30 11/07/2022 
// Design Name: 
// Module Name:    KGPminiRISC 
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
module KGPminiRISC(
	input  clk,
	input  rst,
	input [4:0] reg_addr,
//	output [5:0] opcode,
	output [15:0] final_res
);

	wire [1:0] reg_write;
	wire imm_mux_ctrl;
	wire alu_mux_ctrl;
	wire [3:0] alu_op; 	
	wire dmem_enable;
	wire dmem_write_enable;
	wire [1:0] reg_write_mux_ctrl;
	wire [4:0] br_op;
//	wire [31:0] instr_out;
	wire [5:0] opcode;
	wire [5:0] func;
//	wire [31:0] res_out;
//	wire [31:0] alu_res_out;
//	wire [31:0] imm_res_out;
//	wire [31:0] pc;
//	wire [31:0] pc_new;
//	wire [4:0]  rs;
//	wire [4:0]  rt;
//	wire [31:0] reg_val1;
//	wire [31:0] reg_val2;

	 
	control_unit ControlUnit (
		.opcode(opcode),
		.func(func),
		.reg_write(reg_write),
		.imm_mux_ctrl(imm_mux_ctrl),
		.alu_mux_ctrl(alu_mux_ctrl),
		.alu_op(alu_op),
		.dmem_enable(dmem_enable),
		.dmem_write_enable(dmem_write_enable),
		.reg_write_mux_ctrl(reg_write_mux_ctrl),
		.br_op(br_op)
	);
	
	data_path DataPath (
		.clk_in(clk),
		.rst(rst),
		.opcode(opcode),
		.func(func),
		.reg_write(reg_write),
		.imm_mux_ctrl(imm_mux_ctrl),
		.alu_mux_ctrl(alu_mux_ctrl),
		.alu_op(alu_op),
		.dmem_enable(dmem_enable),
		.dmem_write_enable(dmem_write_enable),
		.reg_write_mux_ctrl(reg_write_mux_ctrl),
		.br_op(br_op),
		.final_res(final_res),
		.reg_addr(reg_addr)
	);
	
//	assign res = alu_mux_ctrl;


endmodule
