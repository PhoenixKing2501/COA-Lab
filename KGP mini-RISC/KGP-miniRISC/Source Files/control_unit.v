`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:08 11/07/2022 
// Design Name: 
// Module Name:    control_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit(
	 output [5:0] opcode,
	 output [5:0] func,
	 output clk,
    output rst,
	 output [1:0] reg_write,
	 output imm_mux_ctrl,
	 output alu_mux_ctrl,
	 output [3:0] alu_op,
	 output dmem_enable,
	 output [0:0] dmem_write_enable,
	 output [1:0] reg_write_mux_ctrl,
	 output [4:0] br_op
	);
	
	always @(opcode or func) begin
		case (opcode)
			6'd0: begin
				case (func)
					6'd0: begin			// add
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd1: begin			// comp
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd1};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					default: begin
						reg_write = 2'b00;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd0;
						br_op = 5'b0;
					end
				endcase
			end
			
			6'd1: begin
				case (func)
					6'd0: begin			// addi
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b1;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd1: begin			// compi
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b1;
						alu_op = {1'b0, 3'd1};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					default: begin
						reg_write = 2'b00;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd0;
						br_op = 5'b0;
					end
				endcase
			end
			
			6'd10: begin
				case (func)
					6'd0: begin			// and
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd2};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd1: begin			// xor
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd3};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					default: begin
						reg_write = 2'b00;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = 4'd0;
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd0;
						br_op = 5'b0;
					end
				endcase
			end
			
			6'd20: begin
				case (func)
					6'd0: begin			// shll
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd4};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd1: begin			// shrl
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd5};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd2: begin			// shra
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd6};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					default: begin
						reg_write = 2'b00;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd0;
						br_op = 5'b0;
					end
				endcase
			end
			
			6'd21: begin
				case (func)
					6'd0: begin			// shllv
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b1, 3'd4};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd1: begin			// shrlv
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b1, 3'd5};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					6'd2: begin			// shrav
						reg_write = 2'b01;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b1, 3'd6};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd2;
						br_op = 5'b0;
					end
					
					default: begin
						reg_write = 2'b00;
						imm_mux_ctrl = 1'b0;
						alu_mux_ctrl = 1'b0;
						alu_op = {1'b0, 3'd0};
						dmem_enable = 1'b0;
						dmem_write_enable = 1'b0;
						reg_write_mux_ctrl = 2'd0;
						br_op = 5'b0;
					end
				endcase
			end
			
			6'd30: begin					// lw
				reg_write = 2'b10;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b1;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd1;
				br_op = 5'b0;
			end
			
			6'd31: begin					// sw
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b1;
				alu_mux_ctrl = 1'b1;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b1;
				dmem_write_enable = 1'b1;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b0;
			end
			
			6'd40: begin					// b
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b00001;
			end
			
			6'd41: begin					// bl
				reg_write = 2'b11;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b00101;
			end
			
			6'd42: begin					// bcy
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b00100;
			end
			
			6'd43: begin					// bncy
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b01100;
			end
			
			6'd44: begin					// br
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b00010;
			end
			
			6'd45: begin					// bltz
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b00011;
			end
			
			6'd46: begin					// bz
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b01011;
			end
			
			6'd47: begin					// bnz
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b10011;
			end
			
			6'd50: begin					// diff
				reg_write = 2'b01;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd7};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd2;
				br_op = 5'b0;
			end
			
			default: begin
				reg_write = 2'b00;
				imm_mux_ctrl = 1'b0;
				alu_mux_ctrl = 1'b0;
				alu_op = {1'b0, 3'd0};
				dmem_enable = 1'b0;
				dmem_write_enable = 1'b0;
				reg_write_mux_ctrl = 2'd0;
				br_op = 5'b0;
			end
			
		endcase
		
	end


endmodule