module CLA16BitRC(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] s,
    output cout
    );
	 
	 wire [4:0] c;
	 
	 assign c[0] = cin;
	 
	 CLA4Bit A1(a[3:0], b[3:0], c[0], s[3:0], c[1]);
	 CLA4Bit A2(a[7:4], b[7:4], c[1], s[7:4], c[2]);
	 CLA4Bit A3(a[11:8], b[11:8], c[2], s[11:8], c[3]);
	 CLA4Bit A4(a[15:12], b[15:12], c[3], s[15:12], c[4]);
	 
	 assign cout = c[4];

endmodule