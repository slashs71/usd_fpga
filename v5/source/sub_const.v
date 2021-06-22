module sub_const
(
	input clk,
	input signed [11:0] iData,
	
	output reg [11:0] oData
);

localparam d=10;

always@(posedge clk)
begin
	if (iData>d)
		oData<= iData - d;
	
	if (iData<-d)
		oData<= oData + d;
end

endmodule 