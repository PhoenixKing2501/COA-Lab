module CLA4Bit(
	input [3:0] a,
	input [3:0] b,
	input cin,
	output [3:0] s,
	output cout,
);
	 
	wire [3:0] g, p;
	wire [4:0] c;

	assign	g[0] = (a[0] & b[0]),
			g[1] = (a[1] & b[1]),
			g[2] = (a[2] & b[2]),
			g[3] = (a[3] & b[3]);

	assign	p[0] = (a[0] ^ b[0]),
			p[1] = (a[1] ^ b[1]),
			p[2] = (a[2] ^ b[2]),
			p[3] = (a[3] ^ b[3]);

	assign	c[0] = cin,
			c[1] = (g[0] | (p[0] & c[0])),
			c[2] = (g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0])),
			c[3] = (g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0])),
			c[4] = (g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & [2] & p[1] & p[0] & c[0]));

	assign	s[0] = (p[0] ^ c[0]),
			s[1] = (p[1] ^ c[1]),
			s[2] = (p[2] ^ c[2]),
			s[3] = (p[3] ^ c[3]);

	assign	cout = c[4];

endmodule
