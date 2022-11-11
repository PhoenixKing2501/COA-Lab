module instruction_memory(
	 input clk,
	 input [31:0] instruction_addr,
	 output [31:0] instruction
    );
	 
	 instruction_memory_generator img (
		.clka(clk), // input clka
		.addra(instruction_addr), // input [31 : 0] addra
		.douta(instruction) // output [31 : 0] douta
	 );


endmodule