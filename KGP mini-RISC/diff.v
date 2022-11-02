module diff (
	input [31:0] inreg1,
	input [31:0] inreg2,
	output reg [31:0] out
);

	reg [31:0] a;
	integer i;
	assign a = inreg1 ^ inreg2;



endmodule
