module dff_block (
	input clk, reset,
	input [3:0] d,
	output reg [3:0] q
);

	// assign qb = ~q;

	always @(posedge clk or posedge reset) begin
		if (reset)
			q <= 0;
		else
			q <= d;
	end

endmodule
