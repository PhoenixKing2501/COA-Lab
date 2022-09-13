module dff_block (
	input d, clk, reset,
	output reg q,
	output wire qb
);

	assign qb = ~q;

	always @(posedge clk or posedge reset) begin
		if (reset)
			q <= 0;
		else
			q <= d;
	end

endmodule
