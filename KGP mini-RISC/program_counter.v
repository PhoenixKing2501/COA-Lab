module program_counter (
	input [31:0] PC,
	input clock,
	input reset,
	output reg [31:0] PC_new
);

	always @(posedge clock or posedge reset) begin
		if (reset) begin
			PC = -32'd0;
		end else begin
			PC = PC_new;
		end
	end
	
endmodule
