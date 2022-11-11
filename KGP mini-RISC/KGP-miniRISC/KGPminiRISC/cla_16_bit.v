module cla_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output gout,
    output pout,
    output [15:0] s
    );
	 
	 wire [3:0] g;
	 wire [3:0] p;
	 wire [4:0] c;
	 
	 assign c[0] = cin;
	 
	 lcu_16bit lcu_16bit_1(g[3:0], p[3:0], c[0], gout, pout, c[4:1]); 
	 
	 cla_4bit cla_4bit_1(a[3:0], b[3:0], c[0], g[0], p[0], s[3:0]);	 
	 cla_4bit cla_4bit_2(a[7:4], b[7:4], c[1], g[1], p[1], s[7:4]);
	 cla_4bit cla_4bit_3(a[11:8], b[11:8], c[2], g[2], p[2], s[11:8]);
    cla_4bit cla_4bit_4(a[15:12], b[15:12], c[3], g[3], p[3], s[15:12]);

endmodule