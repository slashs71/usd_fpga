module spi_msv(
	input clk,
	input reset,
//	input rx,
	input	[11:0] idata,
	input newTxData,
	
//	output reg oce,
//	output reg[7:0] odata,
	
//	output reg newRxData,
	
	output reg mosi,sck,ncs,
	
	output reg txBusy
//	output reg rxBusy	
);

localparam txdata_width = 16;
localparam bit_tau=10; //input_Clk=400k   out_clk=40k
localparam bit_mid=bit_tau/2;

reg sclk_int;

(* syn_encoding = "safe" *) reg [2:0] state;

	// Declare states
	
	
	localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
	
	reg[8:0] cnt;	
	reg[8:0] bit_cntr;
	reg[15:0] tx_data;
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S0;
		else
			case (state)
				S0://wait start bit neg edge										
//					if (rx)
						if (newTxData)
							begin
								state		<=S4;
								tx_data 	<={4'b0011, !idata[11],idata[10:0]};
								cnt			<= 0;
								bit_cntr	<= 0;
							end
						else
							begin
								state  	<= S0;
//								newRxData<=0;
							end
//					else
//						begin
//							state <= S1;
//							cnt 	<= 0;
//						end
					
				S1://check duration of start bit
//					if (rx==0)
//						if (cnt<bit_tau)
//							begin
//								cnt	<=cnt+1;
//								state <= S1;
//							end
//						else
//							begin
//								state 	<= S2;
//								cnt		<= 0;
//								bit_cntr	<= 0;
//								rx_data	<= 0;
//							end
//					else
						state <= S0;
				S2://read RX data
//					if (bit_cntr<8)
//						begin
//							state<=S2;
//							if (cnt==bit_mid)
//								begin
//									ce<=1; 
//									rx_data<={rx, rx_data[7:1]};
//								end
//							else 
//								ce<=0;
//							
//							if (cnt<bit_tau)
//								cnt<=cnt+1;
//							else	
//								begin
//									cnt<=0;
//									bit_cntr<=bit_cntr+1;
//								end
//						end
//					else
//						state<=S3;
						state<=S0;
				S3://form newRxData signal
					begin
//						odata<=rx_data;
//						newRxData<=1;
						state <= S0;
					end
				S4://write TX data;
					if (bit_cntr<txdata_width)
						begin
							if (cnt<bit_tau)
								cnt<=cnt+1;
							else	
								begin
									cnt<=0;
									bit_cntr<=bit_cntr+1;
									tx_data	<= tx_data << 1;
								end
						end
						
					else
						state<=S0;				
			endcase
//	oce <= ce;
	end

//transmit data	
always@(posedge clk)	begin
	case(state)
		S4:
//			if (bit_cntr==0)
//				tx=0;
//			else if (bit_cntr==9)
//				tx=1;
//			else
			
			mosi		<= tx_data[txdata_width-1];
				
		default:
			mosi<=1;
	endcase
end						

always@(posedge clk) begin
	case(state)
		S4:
			if ((cnt>bit_mid-2) & (cnt<bit_tau-2))
				sclk_int<=1;
			else
				sclk_int<=0;
				
		default:
				sclk_int<=0;
	endcase
end

always@(posedge clk) begin
	sck	<= sclk_int;
	ncs <= !txBusy;
end

always@(posedge clk) begin
case(state)
		S4:
			txBusy<=1;
		default:
			txBusy<=0;
	endcase
end

//always@(posedge clk) begin
//case(state)
//		S2:
//			rxBusy<=1;
//		default:
//			rxBusy<=0;
//	endcase
//end

endmodule