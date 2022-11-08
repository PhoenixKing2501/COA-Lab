module data_path_5_tb;

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
	wire [31:0] pc;
	wire [31:0] pc_new;
	wire [4:0]  rs;
	wire [4:0]  rt;
	wire [31:0] reg_val1;
	wire [31:0] reg_val2;

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
		.imm_res_out(imm_res_out),
		.pc(pc),
		.pc_new(pc_new),
		.rs(rs),
		.rt(rt),
		.reg_val1(reg_val1),
		.reg_val2(reg_val2)
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
		
		// addi $0, 10
		#20	reg_write = 2'b01;
				alu_op = 4'b0;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b1;
				reg_write_mux_ctrl = 2'b10;
				
		#20;

		// b inc2
		#20 	br_op = 5'b1;

		#20;

		// xor $1, $1
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;

		// addi $1, 2
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

		// b inc4
		#20 	br_op = 5'b1;

		#20;

		// xor $1, $1
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
				br_op = 5'b0;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				reg_write_mux_ctrl = 2'b10;
				
		#20;

		// addi $1, 4
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

		// b exit
		#20 	br_op = 5'b1;

		#20;

		// xor $1, $1
		#20 	reg_write = 2'b01;
				alu_op = 4'b11;
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