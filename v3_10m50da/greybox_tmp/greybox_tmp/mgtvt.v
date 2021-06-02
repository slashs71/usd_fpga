//dcfifo CBX_SINGLE_OUTPUT_FILE="ON" CLOCKS_ARE_SYNCHRONIZED="FALSE" INTENDED_DEVICE_FAMILY=""MAX 10"" LPM_NUMWORDS=512 LPM_SHOWAHEAD="OFF" LPM_TYPE="dcfifo" LPM_WIDTH=12 LPM_WIDTHU=9 OVERFLOW_CHECKING="ON" RDSYNC_DELAYPIPE=4 UNDERFLOW_CHECKING="ON" USE_EAB="OFF" WRSYNC_DELAYPIPE=4 data q rdclk rdempty rdfull rdreq wrclk wrreq
//VERSION_BEGIN 18.0 cbx_mgl 2018:04:24:18:08:49:SJ cbx_stratixii 2018:04:24:18:04:18:SJ cbx_util_mgl 2018:04:24:18:04:18:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2018  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details.



//synthesis_resources = dcfifo 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgtvt
	( 
	data,
	q,
	rdclk,
	rdempty,
	rdfull,
	rdreq,
	wrclk,
	wrreq) /* synthesis synthesis_clearbox=1 */;
	input   [11:0]  data;
	output   [11:0]  q;
	input   rdclk;
	output   rdempty;
	output   rdfull;
	input   rdreq;
	input   wrclk;
	input   wrreq;

	wire  [11:0]   wire_mgl_prim1_q;
	wire  wire_mgl_prim1_rdempty;
	wire  wire_mgl_prim1_rdfull;

	dcfifo   mgl_prim1
	( 
	.data(data),
	.q(wire_mgl_prim1_q),
	.rdclk(rdclk),
	.rdempty(wire_mgl_prim1_rdempty),
	.rdfull(wire_mgl_prim1_rdfull),
	.rdreq(rdreq),
	.wrclk(wrclk),
	.wrreq(wrreq));
	defparam
		mgl_prim1.clocks_are_synchronized = "FALSE",
		mgl_prim1.intended_device_family = ""MAX 10"",
		mgl_prim1.lpm_numwords = 512,
		mgl_prim1.lpm_showahead = "OFF",
		mgl_prim1.lpm_type = "dcfifo",
		mgl_prim1.lpm_width = 12,
		mgl_prim1.lpm_widthu = 9,
		mgl_prim1.overflow_checking = "ON",
		mgl_prim1.rdsync_delaypipe = 4,
		mgl_prim1.underflow_checking = "ON",
		mgl_prim1.use_eab = "OFF",
		mgl_prim1.wrsync_delaypipe = 4;
	assign
		q = wire_mgl_prim1_q,
		rdempty = wire_mgl_prim1_rdempty,
		rdfull = wire_mgl_prim1_rdfull;
endmodule //mgtvt
//VALID FILE
