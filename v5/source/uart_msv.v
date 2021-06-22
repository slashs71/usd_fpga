module uart_msv(
	input clk,
	input reset,
	input rx,
	input	[7:0] idata,
	input newTxData,
	
	output reg oce,
	output reg[7:0] odata,
	output reg newRxData,
	output reg tx,
	output reg txBusy,
	output reg rxBusy	
);

localparam baud=921600/2;
localparam bit_tau=108; //50M
localparam bit_mid=bit_tau/2;
(* syn_encoding = "safe" *) reg [2:0] state;

	// Declare states
	
	
	localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
	
	reg[8:0] cnt;	
	reg[3:0] bit_cntr;
	reg ce;
	reg[7:0] rx_data;
	reg[7:0] tx_data;
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S0;
		else
			case (state)
				S0://wait start bit neg edge										
					if (rx)
						if (newTxData)
							begin
								state		<=S4;
								tx_data 	<=idata;
								cnt		<= 0;
								bit_cntr	<= 0;
							end
						else
							begin
								state  	<= S0;
								newRxData<=0;
							end
					else
						begin
							state <= S1;
							cnt 	<= 0;
						end
					
				S1://check duration of start bit
					if (rx==0)
						if (cnt<bit_tau)
							begin
								cnt	<=cnt+1;
								state <= S1;
							end
						else
							begin
								state 	<= S2;
								cnt		<= 0;
								bit_cntr	<= 0;
								rx_data	<= 0;
							end
					else
						state <= S0;
				S2://read RX data
					if (bit_cntr<8)
						begin
							state<=S2;
							if (cnt==bit_mid)
								begin
									ce<=1; 
									rx_data<={rx, rx_data[7:1]};
								end
							else 
								ce<=0;
							
							if (cnt<bit_tau)
								cnt<=cnt+1;
							else	
								begin
									cnt<=0;
									bit_cntr<=bit_cntr+1;
								end
						end
					else
						state<=S3;
				S3://form newRxData signal
					begin
						odata<=rx_data;
						newRxData<=1;
						state <= S0;
					end
				S4://write TX data;
					if (bit_cntr<10)
						begin
							if (cnt<bit_tau)
								cnt<=cnt+1;
							else	
								begin
									cnt<=0;
									bit_cntr<=bit_cntr+1;
								end
						end
					else
						state<=S0;				
			endcase
	oce <= ce;
	end

//transmit data	
always@(posedge clk)	begin
	case(state)
		S4:
			if (bit_cntr==0)
				tx=0;
			else if (bit_cntr==9)
				tx=1;
			else
				tx<=tx_data[bit_cntr-1];
		default:
			tx<=1;
	endcase
end							
	
always@(posedge clk) begin
case(state)
		S4:
			txBusy<=1;
		default:
			txBusy<=0;
	endcase
end

always@(posedge clk) begin
case(state)
		S2:
			rxBusy<=1;
		default:
			rxBusy<=0;
	endcase
end

endmodule