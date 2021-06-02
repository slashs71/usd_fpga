module fdiv20
(
	input iclk,
	output reg oclk
);

reg[5:0] cnt;
localparam cnt_end=19;

always@(posedge iclk)begin
if (cnt<cnt_end)
	cnt <= cnt+1;
else	
	cnt <= 0;
end 

always@(posedge iclk) begin
if (cnt<cnt_end/2)
	oclk<=1;
else	
	oclk<=0;
end

endmodule