module  binary2straight
(	
	input clk,
	input [11:0]iData,
	
	output reg [11:0] oData
);

always@(posedge clk)begin
	oData <= {!iData[11],iData[10:0]};
end

endmodule 