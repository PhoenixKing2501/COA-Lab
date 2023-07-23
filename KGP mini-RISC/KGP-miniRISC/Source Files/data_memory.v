module data_memory(
	 input clk,
	 input enable,
	 input [0:0] write_enable,
	 input [4:0] addr,
	 input [31:0] write_data,
	 output [31:0] read_data
    );
	 
	 
    data_memory_generator dmg (
        .clka(clk), // input clka
        .ena(enable), // input ena
        .wea(write_enable), // input [0 : 0] wea
        .addra(addr), // input [3 : 0] addra
        .dina(write_data), // input [31 : 0] dina
        .douta(read_data) // output [31 : 0] douta
    );



endmodule