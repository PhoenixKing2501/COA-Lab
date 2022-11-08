module cla_32bit(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] s,
    output cout
    );
	 
	 wire [1:0] g;
	 wire [1:0] p;
	 wire [2:0] c;
	 
	 
	 assign c[0] = cin;
	 
	 lcu_32bit lcu_32bit_1(g[1:0], p[1:0], c[0], c[2:1]); 
	 
	 cla_16bit cla_16bit_1(.a(a[15:0]), .b(b[15:0]), .cin(c[0]), .gout(g[0]), .pout(p[0]), .s(s[15:0]));	 
	 cla_16bit cla_16bit_2(.a(a[31:16]), .b(b[31:16]), .cin(c[1]), .gout(g[1]), .pout(p[1]), .s(s[31:16]));
	 
	 assign cout = c[2];

endmodule