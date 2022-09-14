`include "counter.v"
`include "clock_divider.v"

module wrapper (
	input clk, rst,
	output reg [3:0] out
);

	wire [3:0] out_net;
	wire clk_out;

	always @(posedge clk) begin
		out <= out_net;
	end

	clock_divider cd1(
		.clk_in(clk),
		.clk_out(clk_out)
	);

	counter c1(
		.clk(clk_out),
		.reset(rst),
		.out(out_net)
	);

endmodule
