module clock_divider (
	input clk_in,
	output reg clk_out
);

	reg [31:0] counter = 32'd0;
	// parameter REDUCE = 32'd2;
	parameter REDUCE = 32'd250_000;

	always @(posedge clk_in) begin
		counter <= counter + 32'd1;

		if (counter >= (REDUCE - 1))
			counter <= 32'd0;

		clk_out <= (counter < REDUCE / 2) ? 1'b1 : 1'b0;
	end

endmodule
