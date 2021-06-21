module data_send(
	input clk,
	input rst, full, txBusy,
	
	output reg oNewData,oRdclk	
);

localparam cnt_end = 10;
localparam N = 32;

reg[7:0] data;
reg[9:0] cntN;


(* syn_encoding = "safe" *) reg [2:0] state;

	// Declare states
	
	
	localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;

always@(posedge clk or posedge rst)begin	
	if (rst)
		begin
			state <= S0;
		end
	else
		case (state)
			S0:
				if (full)
					begin
						state<=S1;
						cntN <=0;
					end
				else	
					state<=S0;
					
			S1:	// rdclk
				begin					
					state	<= S2;
				end
			S2: 
				begin
					state	<= S3;
				end
			S3:	// newData
				state	<= S4;
			S4:   // wait for uart not busy
				if (!txBusy)					
					if (cntN<N) begin
						state	<= S1;
						cntN	<= cntN + 1;
					end
				else
					state		<= S0;
			
			
							
		endcase	
end

always@(posedge clk)begin
case (state)
	S1:
		oRdclk<=1;
	default:
		oRdclk<=0;
endcase
end

always@(posedge clk)begin
case (state)
	S3:
		oNewData<=1;
	default:
		oNewData<=0;
endcase
end

endmodule
