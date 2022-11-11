module sign_extend_15_32(
   input  [14:0] imm_in,
   output [31:0] imm_out
	);

	assign imm_out = {17'b0, imm_in};

endmodule