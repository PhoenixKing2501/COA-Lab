module reg_file (
	input [4:0] rs,
	input [4:0] rt,
	input [1:0] reg_write,
	input [31:0] write_data,
	input clk,
	input rst,
	output reg [31:0] reg_val1,
	output reg [31:0] reg_val2
);

	reg signed [31:0] reg_bank [31:0];
	integer i;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			for (i = 0; i < 32; i = i + 1) begin
				reg_bank[i] <= 32'd0;
			end
		end else begin
			case (reg_write)
				2'b01: begin
					reg_bank[rs]    <= write_data;
				end
				2'b10: begin
					reg_bank[rt]    <= write_data;
				end

				2'b11: begin
					reg_bank[5'd31] <= write_data;
				end

				default: begin
					// do nothing
				end

			endcase
		end
	end 

	always @(*) begin
		reg_val1 <= reg_bank[rs];
		reg_val2 <= reg_bank[rt];
	end

endmodule