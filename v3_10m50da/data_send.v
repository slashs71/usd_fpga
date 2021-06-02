module data_send(
	input clk,
	input rst, full, txBusy,
	
	output reg req	
);

localparam cnt_end = 10;
localparam N = 512;

reg[7:0] data;
reg[9:0] cntN;


(* syn_encoding = "safe" *) reg [2:0] state;

	// Declare states
	
	
	localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

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
					
			S1:	// req
				begin					
					state	<= S2;
				end
				
			S2:   // wait for uart not busy
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
		req<=1;
	default:
		req<=0;
endcase
end

endmodule
