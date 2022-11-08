module branch_control(
    input [31:0] pc,
	 input [25:0] label_addr,
    input [20:0] comp_addr,
    input signed [31:0] inreg,
    input carry,
    input [4:0] br_op,
    output[31:0] pc_new,
    output[31:0] pc_branch_link
    );
	 
	 wire [31:0] pc_plus4, pc_reg, pc_label_addr, pc_comp_addr, pc_carry;
	 wire [31:0] pc_comp_rs;
	 
	 assign pc_plus4 = pc + 3'b100;
	 assign pc_reg = inreg;
	 assign pc_label_addr = {pc[31:28], label_addr, 2'b0};
	 assign pc_comp_addr = {pc[31:23], comp_addr, 2'b0};
	 assign pc_branch_link = br_op[2:0] == 3'b101 ? pc_plus4 : 32'b0;

	 // assign pc_comp_rs
	 mux_4x1 m1(.w0(inreg < 0 ? pc_comp_addr : pc_plus4), 
				  .w1(inreg == 0 ? pc_comp_addr : pc_plus4), 
				  .w2(inreg != 0 ? pc_comp_addr : pc_plus4), 
				  .w3(pc_plus4), .s(br_op[4:3]), 
				  .f(pc_comp_rs));
	 
	 /*always @(*) begin
		case (br_op[4:3])
			2'b00:
				begin 
					pc_comp_rs = inreg < 0 ? pc_comp_addr : pc_plus4;
				end
			2'b01:
				begin
					pc_comp_rs = inreg == 0 ? pc_comp_addr : pc_plus4;
				end
			2'b10:
				begin
					pc_comp_rs = inreg != 0 ? pc_comp_addr : pc_plus4;
				end
			default:
				begin
					pc_comp_rs = pc_plus4;
				end
		endcase
	 end*/
	 
	 // assign pc_carry
	 mux_2x1 #(.N(32)) m2(.w0(pc_plus4), .w1(pc_label_addr), .s(br_op[3] ^ carry), .f(pc_carry)); 
	 
	 //assign pc_carry = (br_op[3] ^ carry) ? pc_label_addr : pc_plus4;
	
	 
	 // assign pc_new
	 wire [31:0] pc_new_m3, pc_new_m4;
	 mux_4x1 #(.N(32)) m3(.w0(pc_plus4), .w1(pc_label_addr), .w2(pc_reg), .w3(pc_comp_rs), .s(br_op[1:0]), .f(pc_new_m3));
	 mux_2x1 #(.N(32)) m4(.w0(pc_carry), .w1(pc_label_addr), .s(br_op[0]), .f(pc_new_m4));
	 mux_2x1 #(.N(32)) m5(.w0(pc_new_m3), .w1(pc_new_m4), .s(br_op[2]), .f(pc_new));
	 
	 /*always @(*) begin
        case(br_op[2:0])
            3'b000: 
                begin
                    pc_new = pc_plus4;
                    pcAdd4 = 32'b0;
                end
            3'b001:
                begin
                    pc_new = pc_label_addr;
                    pcAdd4 = 32'b0;
                end
            3'b010:
                begin
                    pc_new = pc_reg;
                    pcAdd4 = 32'b0;
                end
            3'b011:
                begin
                    pc_new = pc_comp_rs;
                    pcAdd4 = 32'b0;
                end
            3'b100:
                begin
                    pc_new = pc_carry;
                    pcAdd4 = 32'b0;
                end
            3'b101:
                begin
                    pc_new = pc_label_addr;
                    pcAdd4 = pc_plus4;
                end
            default:
                begin
                    pc_new = pc_plus4;
                    pcAdd4 = 32'b0;
                end
        endcase
    end*/

endmodule