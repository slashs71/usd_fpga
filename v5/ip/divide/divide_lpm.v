// megafunction wizard: %LPM_DIVIDE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_divide 

// ============================================================
// File Name: divide_lpm.v
// Megafunction Name(s):
// 			lpm_divide
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 132 02/25/2009 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module divide_lpm (
	clock,
	denom,
	numer,
	quotient,
	remain);

	input	  clock;
	input	[7:0]  denom;
	input	[11:0]  numer;
	output	[11:0]  quotient;
	output	[7:0]  remain;

	wire [11:0] sub_wire0;
	wire [7:0] sub_wire1;
	wire [11:0] quotient = sub_wire0[11:0];
	wire [7:0] remain = sub_wire1[7:0];

	lpm_divide	lpm_divide_component (
				.denom (denom),
				.clock (clock),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1),
				.aclr (1'b0),
				.clken (1'b1));
	defparam
		lpm_divide_component.lpm_drepresentation = "UNSIGNED",
		lpm_divide_component.lpm_hint = "LPM_REMAINDERPOSITIVE=TRUE",
		lpm_divide_component.lpm_nrepresentation = "UNSIGNED",
		lpm_divide_component.lpm_pipeline = 1,
		lpm_divide_component.lpm_type = "LPM_DIVIDE",
		lpm_divide_component.lpm_widthd = 8,
		lpm_divide_component.lpm_widthn = 12;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
// Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "-1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_HINT STRING "LPM_REMAINDERPOSITIVE=TRUE"
// Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
// Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "8"
// Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "12"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: denom 0 0 8 0 INPUT NODEFVAL denom[7..0]
// Retrieval info: USED_PORT: numer 0 0 12 0 INPUT NODEFVAL numer[11..0]
// Retrieval info: USED_PORT: quotient 0 0 12 0 OUTPUT NODEFVAL quotient[11..0]
// Retrieval info: USED_PORT: remain 0 0 8 0 OUTPUT NODEFVAL remain[7..0]
// Retrieval info: CONNECT: @numer 0 0 12 0 numer 0 0 12 0
// Retrieval info: CONNECT: @denom 0 0 8 0 denom 0 0 8 0
// Retrieval info: CONNECT: quotient 0 0 12 0 @quotient 0 0 12 0
// Retrieval info: CONNECT: remain 0 0 8 0 @remain 0 0 8 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divide_lpm_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
