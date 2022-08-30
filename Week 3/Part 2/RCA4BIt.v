module RCA4Bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
	 
	 wire [3:1] c;
	 
	 fullAdder FA1(a[0], b[0], cin, s[0], c[1]);
	 fullAdder FA2(a[1], b[1], c[1], s[1], c[2]);
	 fullAdder FA3(a[2], b[2], c[2], s[2], c[3]);
	 fullAdder FA4(a[3], b[3], c[3], s[3], cout);


endmodule