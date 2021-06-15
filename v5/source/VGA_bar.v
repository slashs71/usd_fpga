module	VGA_bar	(	//	Read Out Side
						oRed,
						oGreen,
						oBlue,
						iVGA_X,
						iVGA_Y,
						iVGA_CLK,
						
						iD,
						iDclk,
						iDupd,
						
						//	Control Signals
						iRST_n);
//	Read Out Side
output	reg	[3:0]	oRed;
output	reg	[3:0]	oGreen;
output	reg	[3:0]	oBlue;
input	[9:0]		iVGA_X;
input	[9:0]		iVGA_Y;
input				iVGA_CLK;
input   [11:0]      iD;
input  				iDclk, iDupd;
//	Control Signals
input				iRST_n;


reg[3:0] red,green,blue;
reg[11:0] colors;



reg [11:0] data[31:0];		//32 elements
reg [11:0] D_int;
reg [9:0] cntUpd;
reg i;

always@(posedge iDclk)
begin
	D_int <= iD;
end

always@(posedge iDupd)
begin
	if (cntUpd<60)
		cntUpd<=cntUpd+1;
	else
		cntUpd<=0;
end

//always@(posedge iDclk)
//begin
//	if (cntUpd==0)
//		i <= 0;
//	else
//		if (i<31)
//			i <= i + 1;
//		else
//			i <= 32;
//end

always@(posedge iVGA_CLK)
begin
	if (cntUpd==0) 
		begin
			data[31] <= data[30];
			data[30] <= data[29];
			data[29] <= data[28];
			data[28] <= data[27];
			data[27] <= data[26];
			data[26] <= data[25];
			data[25] <= data[24];
			data[24] <= data[23];
			data[23] <= data[22];
			data[22] <= data[21];
			data[21] <= data[20];
			data[20] <= data[19];
			data[19] <= data[18];
			data[18] <= data[17];
			data[17] <= data[16];
			data[16] <= data[15];
			data[15] <= data[14];
			data[14] <= data[13];
			data[13] <= data[12];
			data[12] <= data[11];
			data[11] <= data[10];
			data[10] <= data[9];
			data[9] <= data[8];
			data[8] <= data[7];
			data[7] <= data[6];
			data[6] <= data[5];
			data[5] <= data[4];
			data[4] <= data[3];
			data[3] <= data[2];
			data[2] <= data[1];
			data[1] <= data[0];
			data[0] <= D_int/25+120;
		end
end

localparam column_width = 15;
localparam row_heigth = 10;
reg [4:0] column,row;

always@(posedge iVGA_CLK)
begin
	column <= iVGA_X/column_width+1;
	row <= iVGA_Y/row_heigth+1;
end

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
		begin
			if (iVGA_Y>119 && iVGA_Y<121)
				begin
					colors	<= 12'ha00;
					red 	<= colors[11:8];
					green	<= colors[7:4];
					blue	<= colors[3:0];
				end
			else
				begin
					colors<=0;
					red<=0;
					green<=0;
					blue<=0;
				end
				
			if (iVGA_Y<data[column])
				begin
					colors	<= 12'h00a;
					red 	<= colors[11:8];
					green	<= colors[7:4];
					blue	<= colors[3:0];
				end
			else
				begin
					colors<=0;
					red<=0;
					green<=0;
					blue<=0;
				end
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
