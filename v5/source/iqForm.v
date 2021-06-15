module iqForm
(
	input clk,
	input [11:0] id,
	
	output reg [11:0] odi,odq
);

reg [11:0] odi_int;
reg [11:0] odq_int;

integer N;

reg [11:0] id_int;


always@(posedge clk) begin
	if (N<3)
		N <= N+1;
	else	
		N <= 0;
end

always@(posedge clk) begin
id_int<=id;
end

always@(posedge clk) begin
	case (N)
		0:
					begin	
						odq_int<=id_int;
						odi_int<=0;
					end
		1:
					begin	
						odq_int<=0;
						odi_int<=id_int;
					end
		2:
					begin	
						odq_int<=-id_int;
						odi_int<=0;
					end
		default:
					begin	
						odq_int<=0;
						odi_int<=-id_int;
					end
	endcase
				
end

always@(posedge clk) begin
odi<=odi_int;
odq<=odq_int;
end

endmodule