module alu(
    input signed [31:0] inreg_1,
    input signed [31:0] inreg_2,
    input [4:0] shamt,
    input [3:0] alu_op,
    output[31:0] outreg,
    output carry
    );
	 
	 wire [31:0] sum, complement, bit_and, bit_xor, shift_amt, sll, srl, sra, diff;

	 // Addition
    wire cout;
	 cla_32bit mainAdder(.a(inreg_1), .b(inreg_2), .cin(1'b0), .s(sum), .cout(cout));  

	 // Complement
    assign complement = ~inreg_2 + 1'b1;
    assign bit_and = inreg_1 & inreg_2;
    assign bit_xor = inreg_1 ^ inreg_2;
    
	 // Shifts - Logical and Arithmetic
	 mux_2x1 #(.N(32)) mux_2x1_s(.w0({27'b0, shamt}), .w1(inreg_2), .s(alu_op[3]), .f(shift_amt));
    assign sll = inreg_1 << shift_amt;
    assign srl = inreg_1 >> shift_amt;
    assign sra = inreg_1 >>> shift_amt;
	 
	 // Complex 
	 diff Diff(.inreg_1(inreg_1), .inreg_2(inreg_2), .out(diff)); 
//	 assign diff = 32'b0;
	 
	 // carry
	 assign carry = alu_op[2:0] == 0 ? cout : 1'b0;
	 
	 // MUX outputs
	 wire [31:0] out_m1;                                        
	 wire [31:0] out_m2;
	 
	 mux_4x1 #(.N(32)) m1(.w0(sum), .w1(complement), .w2(bit_and), .w3(bit_xor), .s(alu_op[1:0]), .f(out_m1));
	 mux_4x1 #(.N(32)) m2(.w0(sll), .w1(srl), .w2(sra), .w3(diff), .s(alu_op[1:0]), .f(out_m2));
	 mux_2x1 #(.N(32)) m3(.w0(out_m1), .w1(out_m2), .s(alu_op[2]), .f(outreg));
	
    /*always @(*) begin
        case(aluop[2:0])
            3'b000: 
                begin
                    outreg = sum;
                    carry = cout;
                end
            3'b001:
                begin
                    outreg = compliment;
                    carry = 1'b0;
                end
            3'b010:
                begin
                    outreg = bitAnd;
                    carry = 1'b0;
                end
            3'b011:
                begin
                    outreg = bitXor;
                    carry = 1'b0;
                end
            3'b100:
                begin
                    outreg = sll;
                    carry = 1'b0;
                end
            3'b101:
                begin
                    outreg = srl;
                    carry = 1'b0;
                end
            3'b110:
                begin
                    outreg = sra;
                    carry = 1'b0;
                end
				3'b111:
					begin
						 outreg = diff;
						 carry = 1'b0;	
					end
            default:
                begin
                    outreg = 32'b0;
                    carry = 1'b0;
                end
        endcase
    end*/

endmodule