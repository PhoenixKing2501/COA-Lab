module CLA_add_1(
	input [3:0] a,
	output [3:0] s
);
	 
	wire [3:0] p;
	wire [3:0] c;

	assign	p[0] = !a[0],
			p[1] =  a[1],
			p[2] =  a[2],
			p[3] =  a[3];

	assign	c[0] = 0,
			c[1] = a[0],
			c[2] = a[1] & a[0],
			c[3] = a[2] & a[1] & a[0];

	assign	s = p ^ c;
	
endmodule
