module fifo_reset
(
	input clk,
	input [4:0] iUsedW,
	
	output reg oRst
);

always@(posedge clk)
begin
	if (iUsedW==15)
		oRst <= 1;
	else
		oRst <= 0;
end

endmodule 