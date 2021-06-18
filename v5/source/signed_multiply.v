module signed_multiply

(
	input clk,
	input signed [11:0] dataa,
	input signed [11:0] datab,
	output reg signed [23:0] dataout
);

	// Declare input and output registers
	reg signed [11:0] dataa_reg;
	reg signed [11:0] datab_reg;
	wire signed [23:0] mult_out;

	// Store the result of the multiply
	assign mult_out = dataa_reg * datab_reg;

	// Update data
	always @ (posedge clk)
	begin
		dataa_reg <= dataa;
		datab_reg <= datab;
		dataout <= mult_out;
	end

endmodule
