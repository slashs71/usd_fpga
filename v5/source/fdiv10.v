module fdiv10
(
	input iclk,
	output reg oclk
);

reg[5:0] cnt;
localparam cnt_end=10;

always@(posedge iclk)begin
if (cnt<cnt_end-1)
	cnt <= cnt+1;
else	
	cnt <= 0;
end 

always@(posedge iclk) begin
	case (cnt)
		0,1,2,3,4:
					oclk	<= 1;
		default:
					oclk	<= 0;
	endcase
end

endmodule