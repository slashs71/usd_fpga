module expand_12to16
(
	input clk,
	input [11:0] iData,
	output reg [15:0] oData
);

always@(posedge clk)
begin
	oData <= {{4{iData[11]}},iData};
end

endmodule 