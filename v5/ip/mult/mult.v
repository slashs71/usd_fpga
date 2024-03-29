// megafunction wizard: %LPM_MULT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_mult 

// ============================================================
// File Name: mult.v
// Megafunction Name(s):
// 			lpm_mult
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
module mult (
	dataa,
	datab,
	result);

	input	[11:0]  dataa;
	input	[11:0]  datab;
	output	[23:0]  result;

	wire [23:0] sub_wire0;
	wire [23:0] result = sub_wire0[23:0];

	lpm_mult	lpm_mult_component (
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.clock (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=5",
		lpm_mult_component.lpm_representation = "UNSIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 12,
		lpm_mult_component.lpm_widthb = 12,
		lpm_mult_component.lpm_widthp = 24;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AutoSizeResult NUMERIC "1"
// Retrieval info: PRIVATE: B_isConstant NUMERIC "0"
// Retrieval info: PRIVATE: ConstantB NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: Latency NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SignedMult NUMERIC "0"
// Retrieval info: PRIVATE: USE_MULT NUMERIC "1"
// Retrieval info: PRIVATE: ValidConstant NUMERIC "0"
// Retrieval info: PRIVATE: WidthA NUMERIC "12"
// Retrieval info: PRIVATE: WidthB NUMERIC "12"
// Retrieval info: PRIVATE: WidthP NUMERIC "24"
// Retrieval info: PRIVATE: aclr NUMERIC "0"
// Retrieval info: PRIVATE: clken NUMERIC "0"
// Retrieval info: PRIVATE: optimize NUMERIC "0"
// Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=5"
// Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MULT"
// Retrieval info: CONSTANT: LPM_WIDTHA NUMERIC "12"
// Retrieval info: CONSTANT: LPM_WIDTHB NUMERIC "12"
// Retrieval info: CONSTANT: LPM_WIDTHP NUMERIC "24"
// Retrieval info: USED_PORT: dataa 0 0 12 0 INPUT NODEFVAL dataa[11..0]
// Retrieval info: USED_PORT: datab 0 0 12 0 INPUT NODEFVAL datab[11..0]
// Retrieval info: USED_PORT: result 0 0 24 0 OUTPUT NODEFVAL result[23..0]
// Retrieval info: CONNECT: @dataa 0 0 12 0 dataa 0 0 12 0
// Retrieval info: CONNECT: result 0 0 24 0 @result 0 0 24 0
// Retrieval info: CONNECT: @datab 0 0 12 0 datab 0 0 12 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL mult.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mult_wave*.jpg FALSE
// Retrieval info: LIB_FILE: lpm
