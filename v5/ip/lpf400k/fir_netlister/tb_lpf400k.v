// Copyright (C) 1988-2006 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

// Altera FIR MegaCore ver 3.3.1 Verilog HDL Testbench
`timescale 100 ps / 100 ps

module tb_lpf400k;

parameter data_file_name = "lpf400k_data_in.txt" ;
parameter output_file_name = "lpf400k_result.txt" ;
parameter DATA_WIDTH = 12;
parameter MSB_RM = 5;
parameter LSB_RM = 15;
parameter ACCUM_WIDTH = 32;
parameter ENDDAT = 2931 ;
parameter NUM_OUT = 2932 ;

wire [ACCUM_WIDTH - MSB_RM - LSB_RM -1:0] fir_res;
integer data_addr_cnt;
initial data_addr_cnt = 0;

wire done;
wire rdy_to_ld;
integer data[0:ENDDAT];
integer data_file;
integer i,j;
//Generate control circuit
reg clk;
reg clk_en;
initial clk = 0;
always
  #50 clk <= ~clk;


integer cnt_clks;

// keep track of clocks
initial cnt_clks = 0;
always @(posedge clk)
  cnt_clks <= cnt_clks + 1'b1;

initial clk_en = 1;
always @(posedge clk)
begin
	if(cnt_clks >82&& cnt_clks<631)  clk_en <= 1'b0;
	else if(cnt_clks >819 && cnt_clks<1007)  clk_en <= 1'b0;
	else if(cnt_clks >1797&& cnt_clks<2587) clk_en <= 1'b0;
	else					clk_en <= 1'b1;
end
// rest Unit under test
reg rst_uut;
initial rst_uut = 1;
always @(posedge clk)
begin
  if (cnt_clks < 5 ) rst_uut <= 1'b1;
  else               rst_uut <= 1'b0;
end                 
                 

reg start;
initial start <= 0;
always @(posedge clk)
begin
if (rst_uut == 1'b1) start <= 1; 
end 
// generate input data stream
always @(posedge clk)
begin
  if (rst_uut == 1'b1)	data_addr_cnt <= 0;
  else if (rdy_to_ld == 1'b1 && clk_en == 1'b1 && rst_uut == 1'b0 && start == 1'b1)
  begin
    if (data_addr_cnt != ENDDAT) data_addr_cnt <= data_addr_cnt + 1'b1;
    else                         data_addr_cnt <= ENDDAT;
  end
end

initial
    begin
    data_file = $fopen(data_file_name,"r");
	 for(j = 0; j <= ENDDAT; j = j + 1)
		i = $fscanf(data_file, "%d", data[j]);
    $fclose(data_file);
end

reg [DATA_WIDTH-1:0] data_value;
always @(posedge clk) begin
   if (clk_en == 1'b1) begin
      if (rdy_to_ld == 1'b1 && start == 1'b1)
         data_value <= data[data_addr_cnt];
      else
         data_value <= 0;
   end
end

lpf400k  UUT (.clk(clk),
          .rst(rst_uut),
          .data_in(data_value), 
          .clk_en(clk_en),
          .done(done),
          .rdy_to_ld(rdy_to_ld),
          .fir_result(fir_res) );


// write the output to a file
integer fid;
integer samp_cnt;

initial
begin
  fid = $fopen(output_file_name);
  samp_cnt = 0;
end
  
real fir_conv;
real conv;
reg [ACCUM_WIDTH - MSB_RM - LSB_RM : 0] conv_vec;
always @(posedge clk)
begin
conv_vec <= 1<<(ACCUM_WIDTH - MSB_RM - LSB_RM);
conv <= conv_vec;
end
  
always @(fir_res)
begin
  if (fir_res[ACCUM_WIDTH - MSB_RM - LSB_RM-1] == 1 ) 
      fir_conv <= fir_res - conv;
  else
     fir_conv <= fir_res;
end 


always @(posedge clk)
begin
	if(done == 1 && clk_en == 1 && start == 1)
	begin
		samp_cnt <= samp_cnt + 1;
		$fwrite (fid, "%17.0f\n",fir_conv);
	end
end 

// end simulation and write results into files
always @(data_addr_cnt)
begin
  if (data_addr_cnt == ENDDAT - 10)
  begin
     $fclose(fid);
     $stop;
  end
end
endmodule
