//	Copyright (C) 1988-2007 Altera Corporation

//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.

//   NCO ver 9.0 VERILOG HDL TESTBENCH
`timescale 1ps / 1ps
module nco_tb;
wire [11:0] sin_val;
reg [31:0] phi;
wire out_valid;
reg reset_n;
wire reset; 
assign reset = !reset_n;
reg clken;
reg clk;

initial
  begin
    $dumpvars;
    #0 clk = 1'b0;
    #0 reset_n = 1'b0;
    #0 clken = 1'b1;
    #0 phi = 32'b00100000000000000000000000000000;
    #-794967297 reset_n = 1'b1;
  end

always
  begin
    #250000000 clk = 1;
    #250000000 clk = 0;
  end

integer sin_ch, sin_print;
initial
  begin
    sin_ch = $fopen ("fsin_o_ver_nco.txt");
  end

always @(posedge clk)
  begin
    if(reset_n==1'b1 & out_valid==1'b1)
      begin
        if (sin_val[11:0] < (1<<11))
          sin_print = sin_val[11:0];
        else
          sin_print =  sin_val[11:0] - (1<<12);

    $fdisplay (sin_ch, "%d", sin_print);
      end
end

nco i_nco (
    .out_valid(out_valid),
    .fsin_o(sin_val[11:0]),
    .phi_inc_i(phi[31:0]),
    .reset_n(reset_n),
    .clken(clken),
    .clk(clk)
    );

endmodule
