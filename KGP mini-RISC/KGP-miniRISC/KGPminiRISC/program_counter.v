module program_counter (
	input [31:0] pc_new,
	input clk,
	input rst,
	output reg [31:0] pc
);

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			pc = 32'd0;
		end else begin
			pc = pc_new;
		end
	end
	
endmodule