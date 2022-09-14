module wrapper (
	input clk, rst,
	output reg [3:0] out
);

	wire [3:0] out_net;

	always @(posedge clk) begin
		out <= out_net;
	end

	counter c1(
		.clk(clk),
		.reset(rst),
		.out(out)
	);

endmodule
