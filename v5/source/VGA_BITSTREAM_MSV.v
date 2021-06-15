module	VGA_BITSTREAM_MSV	(	//	Read Out Side
						oRed,
						oGreen,
						oBlue,
						iVGA_X,
						iVGA_Y,
						iVGA_CLK,
						//	Control Signals
						iRST_n,
						iBit);
//	Read Out Side
output	reg	[3:0]	oRed;
output	reg	[3:0]	oGreen;
output	reg	[3:0]	oBlue;
input	[9:0]		iVGA_X;
input	[9:0]		iVGA_Y;
input				iVGA_CLK;
//	Control Signals
input				iRST_n;
input				iBit;

reg[3:0] red,green,blue;
reg[11:0] colors;

always@(posedge iVGA_CLK or negedge iRST_n)
begin
	if (!iRST_n)
		begin
			colors=0;
			red<=0;
			green<=0;
			blue<=0;
		end
	else
		if (iVGA_X<512 && iVGA_Y<450)
			if (iBit)
				begin
					colors	<= 12'h0a0;
					red 	<= colors[11:8];
					green	<= colors[7:4];
					blue	<= colors[3:0];
				end
			else
				begin
					colors=0;
					red<=0;
					green<=0;
					blue<=0;
				end
		else
			begin
				colors=0;
				red<=0;
				green<=0;
				blue<=0;
			end
end

always@(posedge iVGA_CLK or negedge iRST_n)
begin
	if(!iRST_n)
		begin
			oRed	<=	0;
			oGreen	<=	0;
			oBlue	<=	0;
		end
	else
		begin
			oRed	<= red;
			oGreen	<= green;
			oBlue	<= blue;
		end
end

endmodule
