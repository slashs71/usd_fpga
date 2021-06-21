module dly_reg
(
	input clk,
	input [11:0] iData,
	
	output reg [11:0] oData
);


localparam dly=16;

//reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
reg [11:0] ram [dly-1:0];

always@(posedge clk) oData <= ram[15];


always@(posedge clk)
begin
	ram[15] <= ram[14];
	ram[14] <= ram[13];
	ram[13] <= ram[12];
	ram[12] <= ram[11];
	ram[11] <= ram[10];
	ram[10] <= ram[9];
	ram[9] <= ram[8];
	ram[8] <= ram[7];
	ram[7] <= ram[6];
	ram[6] <= ram[5];
	ram[5] <= ram[4];
	ram[4] <= ram[3];
	ram[3] <= ram[2];
	ram[2] <= ram[1];
	ram[1] <= ram[0];
	ram[0] <= iData;
end

endmodule 