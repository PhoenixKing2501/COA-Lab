module CLA16Bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output gout,
    output pout,
    output [15:0] s,
	output cout
    );
	 
	 wire [3:0] g;
	 wire [3:0] p;
	 wire [4:0] c;
	 
	 assign c[0] = cin;
	 
	 LCU lcu(g[3:0], p[3:0], c[0], gout, pout, c[4:1]); 
	 
	 CLA4Bit A1(a[3:0], b[3:0], c[0], g[0], p[0], s[3:0]);	 
	 CLA4Bit A2(a[7:4], b[7:4], c[1], g[1], p[1], s[7:4]);
	 CLA4Bit A3(a[11:8], b[11:8], c[2], g[2], p[2], s[11:8]);
    CLA4Bit A4(a[15:12], b[15:12], c[3], g[3], p[3], s[15:12]);

	 assign cout = c[4];

endmodule
