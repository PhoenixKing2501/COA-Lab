module sign_extend_16_32(
   input  [15:0] imm_in,
   output [31:0] imm_out
	);

	assign imm_out = {16'b0, imm_in};

endmodule