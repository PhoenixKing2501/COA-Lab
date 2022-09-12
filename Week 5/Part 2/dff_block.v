module dff_block (
	input d, clk, reset,
	output reg q,
	output qb,
);

	assign qb = ~q;

	always @(posedge clk) begin
		if (reset)
			q <= 0;
		else
			q <= d;
	end

endmodule
