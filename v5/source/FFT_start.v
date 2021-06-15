module FFT_start
(
	input clk,
	input fifo_full,
	input fifo_empty,
	
	output reg sink_valid,
	output reg sink_sop,
	output reg sink_eop
);

localparam NN = 32;

localparam cnt_end = 1000;
integer cnt=cnt_end;

reg[1:0] full_edge; 
reg start;

always@(posedge clk) begin
	full_edge<={full_edge[0], fifo_full};
end

always@(posedge clk)begin
	if (full_edge==2'b01)
		start=1;
	else
		start=0;
end
 

always@(posedge clk or posedge start)begin
	if (start)
			cnt <= 0;
	else	
		if (cnt<cnt_end)
			cnt<=cnt+1;
		else	
			cnt<=cnt_end;
end

always@(posedge clk) begin
	if ((cnt>=1) && (cnt<=NN))
		sink_valid<=1;
	else	
		sink_valid<=0;
end

always@(posedge clk) begin
	if (cnt==1)
		sink_sop<=1;
	else	
		sink_sop<=0;
end

always@(posedge clk) begin
	if (cnt==NN)
		sink_eop<=1;
	else	
		sink_eop<=0;
end



endmodule