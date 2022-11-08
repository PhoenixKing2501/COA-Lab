module diff (
	input [31:0] inreg1,
	input [31:0] inreg2,
	output [31:0] out
);

	reg [31:0] a;
	reg [31:0] res;

	always @(*) begin
		a = inreg1 ^ inreg2;
		res = -1;

		for (integer i = 31; i >= 0; --i) begin
			if (a[i]) begin
				res <= i;
			end
		end

	end
	
	assign out = res;

endmodule
