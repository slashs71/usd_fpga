module fdiv2
(
	input iclk,
	output oclk
);

reg cnt;

always@(negedge iclk)begin
cnt <= !cnt;
end 

assign oclk = cnt;

endmodule