module LCU(
    input [3:0] g,
    input [3:0] p,
    input cin,
	 output gout,
	 output pout,
	 output [4:1] c
    );
	 
	 assign	c[1] = (g[0] | (p[0] & cin)),
				c[2] = (g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin)),
				c[3] = (g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin)),
				c[4] = (g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin));
				
    assign 	gout = (g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0])),
				pout = (p[3] & p[2] & p[1] & p[0]);

endmodule