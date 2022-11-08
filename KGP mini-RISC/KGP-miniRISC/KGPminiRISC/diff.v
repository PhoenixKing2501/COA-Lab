module diff (
	input [31:0] inreg_1,
	input [31:0] inreg_2,
	output [31:0] out
);

	reg [31:0] a;
	reg [31:0] res;
	integer i;

	always @(*) begin
		a = inreg_1 ^ inreg_2;
		res <= -1;

		for (i = 31; i >= 0; i = i - 1) begin
			if (a[i]) begin
				res <= i;
			end
		end

	end
	
	assign out = res;

endmodule
