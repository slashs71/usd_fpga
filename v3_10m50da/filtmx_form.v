module filtmx_form
(	
	input clk, sink_ready,
	output reg filtmx
);

localparam Nfft=512;

integer cnt;
reg [1:0] sink_edge;

always@(posedge clk)begin
	sink_edge <= {sink_edge[0], sink_ready};
end


always@(posedge clk)begin
	if (sink_edge==2'b01)
		cnt<=0;
	else
		if (cnt<Nfft)
			cnt<=cnt+1;
		else	
			cnt<=Nfft;
end

always@(posedge clk)begin
if (cnt<250)
	filtmx<=0;
else
	filtmx<=1;
end

endmodule