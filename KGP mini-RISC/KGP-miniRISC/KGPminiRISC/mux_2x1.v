module mux_2x1
	 #(parameter N = 32) (
    input [N - 1:0] w0,
    input [N - 1:0] w1,
    input s,
    output reg [N - 1:0] f
    );
	 
	 always @(*)
	 begin
		case (s)
			1'b0: f = w0;
			1'b1: f = w1;
		endcase
	 end


endmodule