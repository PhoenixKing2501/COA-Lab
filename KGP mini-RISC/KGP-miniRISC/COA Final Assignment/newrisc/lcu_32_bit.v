module lcu_32bit(
    input [1:0] g,
    input [1:0] p,
    input cin,
    output [2:1] c
    );
	 
	  assign	c[1] = (g[0] | (p[0] & cin)),
				c[2] = (g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin));

endmodule