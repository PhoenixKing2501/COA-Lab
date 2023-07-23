module data_path(
    input clk,
    input rst,
	 input [1:0] reg_write,
	 input imm_mux_ctrl,
	 input alu_mux_ctrl,
	 input [3:0] alu_op,
	 input dmem_enable,
	 input dmem_write_enable,
	 input [1:0] reg_write_mux_ctrl,
	 input [4:0] br_op,
	 output [31:0] instr_out,
	 output [5:0] opcode,
	 output [5:0] func,
	 output [31:0] res_out,
	 output [31:0] alu_res_out,
	 output [31:0] imm_res_out,
	 output [31:0] pc,
	 output [31:0] pc_new,
	 output [4:0]  rs,
	 output [4:0]  rt,
	 output [31:0] reg_val1,
	 output [31:0] reg_val2
);

//	wire [31:0] pc;
//	wire [31:0] pc_new;
	wire [31:0] instruction;
	wire [31:0] pc_branch_link;
//	wire [5:0]  opcode;
//	wire [5:0]  func;
//	wire [4:0]  rs;
//	wire [4:0]  rt;
	wire [4:0]  shamt;
	wire [14:0] imm_reg;
	wire [15:0] imm_mem;
	wire [25:0] label_addr;
	wire [20:0] comp_addr;
	
	wire [31:0] 
		mem_out,
		//reg_val1,
		//reg_val2,
		imm_reg_ext,
		imm_mem_ext,
		imm_res,
		alu_in2,
		alu_res,
		write_reg_data;
	
	wire carry;
	
	assign instr_out = instruction;
	assign res_out = write_reg_data;
	assign alu_res_out = alu_res;
	assign imm_res_out = imm_res;
	
	reg_file RegFile (
		.rs(rs),
		.rt(rt),
		.reg_write(reg_write),
		.write_data(write_reg_data),
		.clk(clk),
		.rst(rst),
		.reg_val1(reg_val1),
		.reg_val2(reg_val2)
	);
	
	//clock_divider ClockDivider (.clk_in(clk), .clk_out(clk_out));
	
	instruction_decoder InstructionDecoder (
		.instruction(instruction),
		.opcode(opcode),
		.func(func),
		.rs(rs),
		.rt(rt),
		.shamt(shamt),
		.imm_reg(imm_reg),
		.imm_mem(imm_mem),
		.label_addr(label_addr),
		.comp_addr(comp_addr)
	);
	
//	wire [31:0] addr;
//	assign addr = is_branch == 1 ? pc_new : pc;
	
	instruction_memory InstructionMemory (
		.clk(clk),
		.instruction_addr(pc),
		.instruction(instruction)
	);
	
	program_counter ProgramCounter (
		.pc_new(pc_new),
		.pc(pc),
		.clk(clk),
		.rst(rst)
	);
	
	sign_extend_15_32 SignExtend15x32 (
		.imm_in(imm_reg),
		.imm_out(imm_reg_ext)
	);
	
	sign_extend_16_32 SignExtend16x32 (
		.imm_in(imm_mem),
		.imm_out(imm_mem_ext)
	);
	
	mux_2x1 ImmMux (
		.w0(imm_reg_ext),
		.w1(imm_mem_ext),
		.s(imm_mux_ctrl),
		.f(imm_res)
	);
	

	mux_2x1 ALUInMux (
		.w0(reg_val2),
		.w1(imm_res),
		.s(alu_mux_ctrl),
		.f(alu_in2)
	);
	
	alu ALU (
		.inreg_1(reg_val1),
		.inreg_2(alu_in2),
		.shamt(shamt),
		.alu_op(alu_op),
		.outreg(alu_res),
		.carry(carry)
	);
	
	data_memory DataMemory (
		.clk(~clk), 
		.enable(dmem_enable), 
		.write_enable(dmem_write_enable), 
		.addr(alu_res[4:0]), 
		.write_data(reg_val2), 
		.read_data(mem_out) 
	);
	
	mux_4x1 RegWriteMux (
		.w0(pc_branch_link),
		.w1(mem_out),
		.w2(alu_res),
		.w3(32'b0),
		.s(reg_write_mux_ctrl),
		.f(write_reg_data)
	);
	
	branch_control BranchControl (
//		.clk(clk),
		.pc(pc),
		.label_addr(label_addr),
		.comp_addr(comp_addr),
		.inreg(reg_val1),
		.carry(carry),
		.br_op(br_op),
		.pc_new(pc_new),
		.pc_branch_link(pc_branch_link)
	);

endmodule