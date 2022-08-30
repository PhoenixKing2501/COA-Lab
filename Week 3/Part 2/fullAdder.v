module fullAdder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
	 
	 assign s = a ^ b ^ cin;
	 assign cout = (a & b) | (b & cin) | (cin & a);


endmodule