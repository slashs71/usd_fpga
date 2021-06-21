module fft_overlay
(
	input clk, iRst,
	input [4:0] iUsedW,
	input iFull,
	
	output reg oWrreq
);

(* syn_encoding = "safe" *) reg [1:0] state;

// Declare states
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

always@(posedge clk or posedge iRst)
begin
	if (iRst)
		state <= S0;
	else
		case(state)
			S0:
				begin
					if (iUsedW==14)
						state<=S1;
					else
						state<=S0;
				end
			S1:
				begin
					if (iFull)
						state	<= S0;
					else
						state	<= S1;
				end
		endcase
end

always@(posedge clk)
begin
	case(state)
		S1:
			oWrreq <= 1;
		default:
			oWrreq <=0;
	endcase
end

endmodule 