module hann32
(
	input clk, 
	input rst,
	output reg [11:0] value
);

localparam N = 32;

reg [5:0] cntN;


always@(posedge clk or posedge rst) begin
if (rst)
	cntN<=0;
else
	if (cntN<N)
		cntN<=cntN+1;
	else	
		cntN<=N;
end


always@(posedge clk)begin
	case (cntN)
		1, 31:
				 value <= 20;
		2, 30:
				 value <= 78;
		3, 29:
				 value <= 173;
		4, 28:
				 value <= 300;
		5, 27:
				 value <= 455;
		6, 26:
				 value <= 632;
		7, 25:
				 value <= 824;
		8, 24:
				 value <= 1024;
		9, 23:
				 value <= 1224;
		10, 22:
				 value <= 1416;
		11, 21:
				 value <= 1593;
		12, 20:
				 value <= 1748;
		13, 19:
				 value <= 1875;
		14, 18:
				 value <= 1970;
		15, 17:
				 value <= 2028;
		16:
				 value <= 2047;					
		default:
					value <= 0;
	endcase
end

endmodule