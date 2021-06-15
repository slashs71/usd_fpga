module FillRAM
(
	input clk,
	input [9:0] iX,iY,
	input [11:0] iData,
	
	output reg oPixel,
	output [16:0] oAddr	
);

assign oAddr = {iY[7:0],iX[8:0]};

always@(posedge clk)
begin
	if (iX>0 && iX<500 && iY<256)
		oPixel <= 1;
	else
		oPixel <= 0;
end

endmodule 