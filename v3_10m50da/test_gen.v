module test_gen(
	input clk,
	input[7:0] idata,
	input newRxData,
	input rst,
	input txBusy,
	
	output reg[7:0] odata,
	output reg oe	
);

localparam cnt_end = 10;
localparam N_end = 100;

reg[15:0] cnt=cnt_end;
reg[7:0] data;
reg[7:0] N;
reg[7:0] cntN;
reg[7:0] cntDly;

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
				if (newRxData)
					state<=S1;
				else	
					state<=S0;
					
			S1:
				begin
					N 		<= idata;
					cnt	<= 0;
					cntN	<= 0;
					state	<= S2;
				end
				
			S2:
				begin
					odata	<=	cnt;					
					state	<= S3;
					cntDly<=0;
				end
			
			S3:
				if (cntDly<100)
					begin
						cntDly	<= cntDly+1;
						state		<=	S3;
					end
				else
					state<=S4;
			
			S4:
				begin					
					if (!txBusy)
						if (cntN<N)
							begin
								cnt	<= cnt+1;
								cntN	<= cntN+1;
								state	<= S2;
							end
						else	
							state 	<= S0;
					else
						state	<= S4;
				end
							
		endcase	
end

always@(posedge clk)begin
if (state==S2)
	oe	<= 1;
else
	oe <= 0;
end

endmodule
