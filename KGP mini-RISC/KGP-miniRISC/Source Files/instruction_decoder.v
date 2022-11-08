module instruction_decoder(
	input  [31:0] instruction,
	output [5:0]  opcode,
	output [5:0]  func,
	output [4:0]  rs,
	output [4:0]  rt,
	output [4:0]  shamt,
	output [14:0] imm_reg,
	output [15:0] imm_mem,
	output [25:0] label_addr,
	output [20:0] comp_addr
);
	assign opcode   = instruction[31:26];
	assign func     = instruction[5:0];
	assign rs       = instruction[25:21];
	assign rt       = instruction[20:16];
	assign shamt    = instruction[10:6];
	assign imm_reg      = instruction[20:6];
	assign imm_mem    = instruction[15:0];
	assign label_addr   = instruction[25:0];
	assign comp_addr   = instruction[20:0];
	
endmodule