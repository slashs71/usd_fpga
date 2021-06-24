module sub_const
(
	input clk,
	input signed [11:0] iData,
	
	output reg [11:0] oData
);

localparam d=10;

always@(posedge clk)
begin
	oData <= iData/5*4;
end

endmodule 