module color_or
(
	input clk,
	input [3:0] iR1, iG1, iB1,
	input [3:0] iR2, iG2, iB2,
	
	output reg [3:0] oRed, oGreen, oBlue
);


always@(posedge clk)
begin
	oRed   <= iR1 | iR2;
	oGreen <= iG1 | iG2;
	oBlue  <= iB1 | iB2;
end

endmodule 