// Generated by FIR Compiler
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2005 Altera Corporation
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
// 00
// altera message_off 10036
(* altera_attribute = "-name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410" *)
module lpf400k_st (clk, 
              rst, 
              data_in, 
              clk_en, 
              rdy_to_ld, 
              done, 
              fir_result); 
parameter DATA_WIDTH  = 12;
parameter COEF_WIDTH  = 7;
parameter ACCUM_WIDTH = 21;

parameter MSB_RM = 1;
parameter LSB_RM = 8;
parameter WIDTH_SAT = ACCUM_WIDTH-LSB_RM;
input clk, rst;
input [DATA_WIDTH-1:0] data_in;
input clk_en;
output rdy_to_ld;
wire rdy_to_ld;
wire rdy_int;
wire data_ld;
output done;
wire done;
wire done_int;
output [ACCUM_WIDTH-MSB_RM-LSB_RM-1:0] fir_result;
wire addr_low;
assign addr_low = 1'b0;


//--- Parallel TDL Storage ---
wire inv_rst;
assign inv_rst = ~rst;
assign data_ld = rdy_int;
wire [11:0] tdl_0_n;
wire [11:0] tdl_1_n;
wire [11:0] tdl_2_n;
wire [11:0] tdl_3_n;
wire [11:0] tdl_4_n;
wire [11:0] tdl_5_n;
wire [11:0] tdl_6_n;


//--- TDL  ---
tdl_da_lc Utdldalc0n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(data_in), .data_out(tdl_0_n) );
defparam Utdldalc0n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc1n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_0_n), .data_out(tdl_1_n) );
defparam Utdldalc1n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc2n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_1_n), .data_out(tdl_2_n) );
defparam Utdldalc2n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc3n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_2_n), .data_out(tdl_3_n) );
defparam Utdldalc3n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc4n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_3_n), .data_out(tdl_4_n) );
defparam Utdldalc4n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc5n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_4_n), .data_out(tdl_5_n) );
defparam Utdldalc5n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc6n (.clk(clk), .clk_en(rdy_int & clk_en),.rst(rst),.data_in(tdl_5_n), .data_out(tdl_6_n) );
defparam Utdldalc6n.WIDTH = DATA_WIDTH;


// --- ROM LUTs ---- 
// symmetrical adders ...
wire [12:0] sym_res_0_n;
sadd_cen U_0_sym_add (.clk(clk), .gclk_en(clk_en), .ain(tdl_0_n), .bin(tdl_6_n), .res(sym_res_0_n) );
defparam U_0_sym_add.IN_WIDTH = 12;
defparam U_0_sym_add.PIPE_DEPTH = 1;
wire [12:0] sym_res_1_n;
sadd_cen U_1_sym_add (.clk(clk), .gclk_en(clk_en), .ain(tdl_1_n), .bin(tdl_5_n), .res(sym_res_1_n) );
defparam U_1_sym_add.IN_WIDTH = 12;
defparam U_1_sym_add.PIPE_DEPTH = 1;
wire [12:0] sym_res_2_n;
sadd_cen U_2_sym_add (.clk(clk), .gclk_en(clk_en), .ain(tdl_2_n), .bin(tdl_4_n), .res(sym_res_2_n) );
defparam U_2_sym_add.IN_WIDTH = 12;
defparam U_2_sym_add.PIPE_DEPTH = 1;
wire [12:0] sym_res_3_n;
sadd_cen U_3_sym_add (.clk(clk), .gclk_en(clk_en), .ain(tdl_3_n), .bin(12'd0), .res(sym_res_3_n) );
defparam U_3_sym_add.IN_WIDTH = 12;
defparam U_3_sym_add.PIPE_DEPTH = 1;


wire [9:0] lut_val_0_n_0_pp;
rom_lut_r_cen Ur0_n_0_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[0],sym_res_2_n[0],sym_res_1_n[0],sym_res_0_n[0] } ), .data_out( lut_val_0_n_0_pp[9:0]) ) ;
 defparam Ur0_n_0_pp.DATA_WIDTH = 10;
defparam Ur0_n_0_pp.C0 = 10'd                   0;
defparam Ur0_n_0_pp.C1 = 10'd                  18;
defparam Ur0_n_0_pp.C2 = 10'd                  62;
defparam Ur0_n_0_pp.C3 = 10'd                  80;
defparam Ur0_n_0_pp.C4 = 10'd                 108;
defparam Ur0_n_0_pp.C5 = 10'd                 126;
defparam Ur0_n_0_pp.C6 = 10'd                 170;
defparam Ur0_n_0_pp.C7 = 10'd                 188;
defparam Ur0_n_0_pp.C8 = 10'd                 127;
defparam Ur0_n_0_pp.C9 = 10'd                 145;
defparam Ur0_n_0_pp.CA = 10'd                 189;
defparam Ur0_n_0_pp.CB = 10'd                 207;
defparam Ur0_n_0_pp.CC = 10'd                 235;
defparam Ur0_n_0_pp.CD = 10'd                 253;
defparam Ur0_n_0_pp.CE = 10'd                 297;
defparam Ur0_n_0_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_1_pp;
rom_lut_r_cen Ur0_n_1_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[1],sym_res_2_n[1],sym_res_1_n[1],sym_res_0_n[1] } ), .data_out( lut_val_0_n_1_pp[9:0]) ) ;
 defparam Ur0_n_1_pp.DATA_WIDTH = 10;
defparam Ur0_n_1_pp.C0 = 10'd                   0;
defparam Ur0_n_1_pp.C1 = 10'd                  18;
defparam Ur0_n_1_pp.C2 = 10'd                  62;
defparam Ur0_n_1_pp.C3 = 10'd                  80;
defparam Ur0_n_1_pp.C4 = 10'd                 108;
defparam Ur0_n_1_pp.C5 = 10'd                 126;
defparam Ur0_n_1_pp.C6 = 10'd                 170;
defparam Ur0_n_1_pp.C7 = 10'd                 188;
defparam Ur0_n_1_pp.C8 = 10'd                 127;
defparam Ur0_n_1_pp.C9 = 10'd                 145;
defparam Ur0_n_1_pp.CA = 10'd                 189;
defparam Ur0_n_1_pp.CB = 10'd                 207;
defparam Ur0_n_1_pp.CC = 10'd                 235;
defparam Ur0_n_1_pp.CD = 10'd                 253;
defparam Ur0_n_1_pp.CE = 10'd                 297;
defparam Ur0_n_1_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_2_pp;
rom_lut_r_cen Ur0_n_2_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[2],sym_res_2_n[2],sym_res_1_n[2],sym_res_0_n[2] } ), .data_out( lut_val_0_n_2_pp[9:0]) ) ;
 defparam Ur0_n_2_pp.DATA_WIDTH = 10;
defparam Ur0_n_2_pp.C0 = 10'd                   0;
defparam Ur0_n_2_pp.C1 = 10'd                  18;
defparam Ur0_n_2_pp.C2 = 10'd                  62;
defparam Ur0_n_2_pp.C3 = 10'd                  80;
defparam Ur0_n_2_pp.C4 = 10'd                 108;
defparam Ur0_n_2_pp.C5 = 10'd                 126;
defparam Ur0_n_2_pp.C6 = 10'd                 170;
defparam Ur0_n_2_pp.C7 = 10'd                 188;
defparam Ur0_n_2_pp.C8 = 10'd                 127;
defparam Ur0_n_2_pp.C9 = 10'd                 145;
defparam Ur0_n_2_pp.CA = 10'd                 189;
defparam Ur0_n_2_pp.CB = 10'd                 207;
defparam Ur0_n_2_pp.CC = 10'd                 235;
defparam Ur0_n_2_pp.CD = 10'd                 253;
defparam Ur0_n_2_pp.CE = 10'd                 297;
defparam Ur0_n_2_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_3_pp;
rom_lut_r_cen Ur0_n_3_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[3],sym_res_2_n[3],sym_res_1_n[3],sym_res_0_n[3] } ), .data_out( lut_val_0_n_3_pp[9:0]) ) ;
 defparam Ur0_n_3_pp.DATA_WIDTH = 10;
defparam Ur0_n_3_pp.C0 = 10'd                   0;
defparam Ur0_n_3_pp.C1 = 10'd                  18;
defparam Ur0_n_3_pp.C2 = 10'd                  62;
defparam Ur0_n_3_pp.C3 = 10'd                  80;
defparam Ur0_n_3_pp.C4 = 10'd                 108;
defparam Ur0_n_3_pp.C5 = 10'd                 126;
defparam Ur0_n_3_pp.C6 = 10'd                 170;
defparam Ur0_n_3_pp.C7 = 10'd                 188;
defparam Ur0_n_3_pp.C8 = 10'd                 127;
defparam Ur0_n_3_pp.C9 = 10'd                 145;
defparam Ur0_n_3_pp.CA = 10'd                 189;
defparam Ur0_n_3_pp.CB = 10'd                 207;
defparam Ur0_n_3_pp.CC = 10'd                 235;
defparam Ur0_n_3_pp.CD = 10'd                 253;
defparam Ur0_n_3_pp.CE = 10'd                 297;
defparam Ur0_n_3_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_4_pp;
rom_lut_r_cen Ur0_n_4_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[4],sym_res_2_n[4],sym_res_1_n[4],sym_res_0_n[4] } ), .data_out( lut_val_0_n_4_pp[9:0]) ) ;
 defparam Ur0_n_4_pp.DATA_WIDTH = 10;
defparam Ur0_n_4_pp.C0 = 10'd                   0;
defparam Ur0_n_4_pp.C1 = 10'd                  18;
defparam Ur0_n_4_pp.C2 = 10'd                  62;
defparam Ur0_n_4_pp.C3 = 10'd                  80;
defparam Ur0_n_4_pp.C4 = 10'd                 108;
defparam Ur0_n_4_pp.C5 = 10'd                 126;
defparam Ur0_n_4_pp.C6 = 10'd                 170;
defparam Ur0_n_4_pp.C7 = 10'd                 188;
defparam Ur0_n_4_pp.C8 = 10'd                 127;
defparam Ur0_n_4_pp.C9 = 10'd                 145;
defparam Ur0_n_4_pp.CA = 10'd                 189;
defparam Ur0_n_4_pp.CB = 10'd                 207;
defparam Ur0_n_4_pp.CC = 10'd                 235;
defparam Ur0_n_4_pp.CD = 10'd                 253;
defparam Ur0_n_4_pp.CE = 10'd                 297;
defparam Ur0_n_4_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_5_pp;
rom_lut_r_cen Ur0_n_5_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[5],sym_res_2_n[5],sym_res_1_n[5],sym_res_0_n[5] } ), .data_out( lut_val_0_n_5_pp[9:0]) ) ;
 defparam Ur0_n_5_pp.DATA_WIDTH = 10;
defparam Ur0_n_5_pp.C0 = 10'd                   0;
defparam Ur0_n_5_pp.C1 = 10'd                  18;
defparam Ur0_n_5_pp.C2 = 10'd                  62;
defparam Ur0_n_5_pp.C3 = 10'd                  80;
defparam Ur0_n_5_pp.C4 = 10'd                 108;
defparam Ur0_n_5_pp.C5 = 10'd                 126;
defparam Ur0_n_5_pp.C6 = 10'd                 170;
defparam Ur0_n_5_pp.C7 = 10'd                 188;
defparam Ur0_n_5_pp.C8 = 10'd                 127;
defparam Ur0_n_5_pp.C9 = 10'd                 145;
defparam Ur0_n_5_pp.CA = 10'd                 189;
defparam Ur0_n_5_pp.CB = 10'd                 207;
defparam Ur0_n_5_pp.CC = 10'd                 235;
defparam Ur0_n_5_pp.CD = 10'd                 253;
defparam Ur0_n_5_pp.CE = 10'd                 297;
defparam Ur0_n_5_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_6_pp;
rom_lut_r_cen Ur0_n_6_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[6],sym_res_2_n[6],sym_res_1_n[6],sym_res_0_n[6] } ), .data_out( lut_val_0_n_6_pp[9:0]) ) ;
 defparam Ur0_n_6_pp.DATA_WIDTH = 10;
defparam Ur0_n_6_pp.C0 = 10'd                   0;
defparam Ur0_n_6_pp.C1 = 10'd                  18;
defparam Ur0_n_6_pp.C2 = 10'd                  62;
defparam Ur0_n_6_pp.C3 = 10'd                  80;
defparam Ur0_n_6_pp.C4 = 10'd                 108;
defparam Ur0_n_6_pp.C5 = 10'd                 126;
defparam Ur0_n_6_pp.C6 = 10'd                 170;
defparam Ur0_n_6_pp.C7 = 10'd                 188;
defparam Ur0_n_6_pp.C8 = 10'd                 127;
defparam Ur0_n_6_pp.C9 = 10'd                 145;
defparam Ur0_n_6_pp.CA = 10'd                 189;
defparam Ur0_n_6_pp.CB = 10'd                 207;
defparam Ur0_n_6_pp.CC = 10'd                 235;
defparam Ur0_n_6_pp.CD = 10'd                 253;
defparam Ur0_n_6_pp.CE = 10'd                 297;
defparam Ur0_n_6_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_7_pp;
rom_lut_r_cen Ur0_n_7_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[7],sym_res_2_n[7],sym_res_1_n[7],sym_res_0_n[7] } ), .data_out( lut_val_0_n_7_pp[9:0]) ) ;
 defparam Ur0_n_7_pp.DATA_WIDTH = 10;
defparam Ur0_n_7_pp.C0 = 10'd                   0;
defparam Ur0_n_7_pp.C1 = 10'd                  18;
defparam Ur0_n_7_pp.C2 = 10'd                  62;
defparam Ur0_n_7_pp.C3 = 10'd                  80;
defparam Ur0_n_7_pp.C4 = 10'd                 108;
defparam Ur0_n_7_pp.C5 = 10'd                 126;
defparam Ur0_n_7_pp.C6 = 10'd                 170;
defparam Ur0_n_7_pp.C7 = 10'd                 188;
defparam Ur0_n_7_pp.C8 = 10'd                 127;
defparam Ur0_n_7_pp.C9 = 10'd                 145;
defparam Ur0_n_7_pp.CA = 10'd                 189;
defparam Ur0_n_7_pp.CB = 10'd                 207;
defparam Ur0_n_7_pp.CC = 10'd                 235;
defparam Ur0_n_7_pp.CD = 10'd                 253;
defparam Ur0_n_7_pp.CE = 10'd                 297;
defparam Ur0_n_7_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_8_pp;
rom_lut_r_cen Ur0_n_8_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[8],sym_res_2_n[8],sym_res_1_n[8],sym_res_0_n[8] } ), .data_out( lut_val_0_n_8_pp[9:0]) ) ;
 defparam Ur0_n_8_pp.DATA_WIDTH = 10;
defparam Ur0_n_8_pp.C0 = 10'd                   0;
defparam Ur0_n_8_pp.C1 = 10'd                  18;
defparam Ur0_n_8_pp.C2 = 10'd                  62;
defparam Ur0_n_8_pp.C3 = 10'd                  80;
defparam Ur0_n_8_pp.C4 = 10'd                 108;
defparam Ur0_n_8_pp.C5 = 10'd                 126;
defparam Ur0_n_8_pp.C6 = 10'd                 170;
defparam Ur0_n_8_pp.C7 = 10'd                 188;
defparam Ur0_n_8_pp.C8 = 10'd                 127;
defparam Ur0_n_8_pp.C9 = 10'd                 145;
defparam Ur0_n_8_pp.CA = 10'd                 189;
defparam Ur0_n_8_pp.CB = 10'd                 207;
defparam Ur0_n_8_pp.CC = 10'd                 235;
defparam Ur0_n_8_pp.CD = 10'd                 253;
defparam Ur0_n_8_pp.CE = 10'd                 297;
defparam Ur0_n_8_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_9_pp;
rom_lut_r_cen Ur0_n_9_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[9],sym_res_2_n[9],sym_res_1_n[9],sym_res_0_n[9] } ), .data_out( lut_val_0_n_9_pp[9:0]) ) ;
 defparam Ur0_n_9_pp.DATA_WIDTH = 10;
defparam Ur0_n_9_pp.C0 = 10'd                   0;
defparam Ur0_n_9_pp.C1 = 10'd                  18;
defparam Ur0_n_9_pp.C2 = 10'd                  62;
defparam Ur0_n_9_pp.C3 = 10'd                  80;
defparam Ur0_n_9_pp.C4 = 10'd                 108;
defparam Ur0_n_9_pp.C5 = 10'd                 126;
defparam Ur0_n_9_pp.C6 = 10'd                 170;
defparam Ur0_n_9_pp.C7 = 10'd                 188;
defparam Ur0_n_9_pp.C8 = 10'd                 127;
defparam Ur0_n_9_pp.C9 = 10'd                 145;
defparam Ur0_n_9_pp.CA = 10'd                 189;
defparam Ur0_n_9_pp.CB = 10'd                 207;
defparam Ur0_n_9_pp.CC = 10'd                 235;
defparam Ur0_n_9_pp.CD = 10'd                 253;
defparam Ur0_n_9_pp.CE = 10'd                 297;
defparam Ur0_n_9_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_10_pp;
rom_lut_r_cen Ur0_n_10_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[10],sym_res_2_n[10],sym_res_1_n[10],sym_res_0_n[10] } ), .data_out( lut_val_0_n_10_pp[9:0]) ) ;
 defparam Ur0_n_10_pp.DATA_WIDTH = 10;
defparam Ur0_n_10_pp.C0 = 10'd                   0;
defparam Ur0_n_10_pp.C1 = 10'd                  18;
defparam Ur0_n_10_pp.C2 = 10'd                  62;
defparam Ur0_n_10_pp.C3 = 10'd                  80;
defparam Ur0_n_10_pp.C4 = 10'd                 108;
defparam Ur0_n_10_pp.C5 = 10'd                 126;
defparam Ur0_n_10_pp.C6 = 10'd                 170;
defparam Ur0_n_10_pp.C7 = 10'd                 188;
defparam Ur0_n_10_pp.C8 = 10'd                 127;
defparam Ur0_n_10_pp.C9 = 10'd                 145;
defparam Ur0_n_10_pp.CA = 10'd                 189;
defparam Ur0_n_10_pp.CB = 10'd                 207;
defparam Ur0_n_10_pp.CC = 10'd                 235;
defparam Ur0_n_10_pp.CD = 10'd                 253;
defparam Ur0_n_10_pp.CE = 10'd                 297;
defparam Ur0_n_10_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_11_pp;
rom_lut_r_cen Ur0_n_11_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[11],sym_res_2_n[11],sym_res_1_n[11],sym_res_0_n[11] } ), .data_out( lut_val_0_n_11_pp[9:0]) ) ;
 defparam Ur0_n_11_pp.DATA_WIDTH = 10;
defparam Ur0_n_11_pp.C0 = 10'd                   0;
defparam Ur0_n_11_pp.C1 = 10'd                  18;
defparam Ur0_n_11_pp.C2 = 10'd                  62;
defparam Ur0_n_11_pp.C3 = 10'd                  80;
defparam Ur0_n_11_pp.C4 = 10'd                 108;
defparam Ur0_n_11_pp.C5 = 10'd                 126;
defparam Ur0_n_11_pp.C6 = 10'd                 170;
defparam Ur0_n_11_pp.C7 = 10'd                 188;
defparam Ur0_n_11_pp.C8 = 10'd                 127;
defparam Ur0_n_11_pp.C9 = 10'd                 145;
defparam Ur0_n_11_pp.CA = 10'd                 189;
defparam Ur0_n_11_pp.CB = 10'd                 207;
defparam Ur0_n_11_pp.CC = 10'd                 235;
defparam Ur0_n_11_pp.CD = 10'd                 253;
defparam Ur0_n_11_pp.CE = 10'd                 297;
defparam Ur0_n_11_pp.CF = 10'd                 315;
wire [9:0] lut_val_0_n_12_pp;
rom_lut_r_cen Ur0_n_12_pp (.clk(clk),.gclk_en(clk_en),.addr_in( {sym_res_3_n[12],sym_res_2_n[12],sym_res_1_n[12],sym_res_0_n[12] } ), .data_out( lut_val_0_n_12_pp[9:0]) ) ;
 defparam Ur0_n_12_pp.DATA_WIDTH = 10;
defparam Ur0_n_12_pp.C0 = 10'd                   0;
defparam Ur0_n_12_pp.C1 = 10'd                1006;
defparam Ur0_n_12_pp.C2 = 10'd                 962;
defparam Ur0_n_12_pp.C3 = 10'd                 944;
defparam Ur0_n_12_pp.C4 = 10'd                 916;
defparam Ur0_n_12_pp.C5 = 10'd                 898;
defparam Ur0_n_12_pp.C6 = 10'd                 854;
defparam Ur0_n_12_pp.C7 = 10'd                 836;
defparam Ur0_n_12_pp.C8 = 10'd                 897;
defparam Ur0_n_12_pp.C9 = 10'd                 879;
defparam Ur0_n_12_pp.CA = 10'd                 835;
defparam Ur0_n_12_pp.CB = 10'd                 817;
defparam Ur0_n_12_pp.CC = 10'd                 789;
defparam Ur0_n_12_pp.CD = 10'd                 771;
defparam Ur0_n_12_pp.CE = 10'd                 727;
defparam Ur0_n_12_pp.CF = 10'd                 709;


// ---- partial product adder tree ----

wire [21:0] lut_0_bit_0_fill;
wire [21:0] lut_0_bit_1_fill;
wire [21:0] lut_0_bit_2_fill;
wire [21:0] lut_0_bit_3_fill;
wire [21:0] lut_0_bit_4_fill;
wire [21:0] lut_0_bit_5_fill;
wire [21:0] lut_0_bit_6_fill;
wire [21:0] lut_0_bit_7_fill;
wire [21:0] lut_0_bit_8_fill;
wire [21:0] lut_0_bit_9_fill;
wire [21:0] lut_0_bit_10_fill;
wire [21:0] lut_0_bit_11_fill;
wire [21:0] lut_0_bit_12_fill;
assign lut_0_bit_0_fill = {lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9], lut_val_0_n_0_pp[9],  lut_val_0_n_0_pp };
assign lut_0_bit_1_fill = {lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9], lut_val_0_n_1_pp[9],  lut_val_0_n_1_pp, 1'd0 };
assign lut_0_bit_2_fill = {lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9], lut_val_0_n_2_pp[9],  lut_val_0_n_2_pp, 2'd0 };
assign lut_0_bit_3_fill = {lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9], lut_val_0_n_3_pp[9],  lut_val_0_n_3_pp, 3'd0 };
assign lut_0_bit_4_fill = {lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9], lut_val_0_n_4_pp[9],  lut_val_0_n_4_pp, 4'd0 };
assign lut_0_bit_5_fill = {lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9], lut_val_0_n_5_pp[9],  lut_val_0_n_5_pp, 5'd0 };
assign lut_0_bit_6_fill = {lut_val_0_n_6_pp[9], lut_val_0_n_6_pp[9], lut_val_0_n_6_pp[9], lut_val_0_n_6_pp[9], lut_val_0_n_6_pp[9], lut_val_0_n_6_pp[9],  lut_val_0_n_6_pp, 6'd0 };
assign lut_0_bit_7_fill = {lut_val_0_n_7_pp[9], lut_val_0_n_7_pp[9], lut_val_0_n_7_pp[9], lut_val_0_n_7_pp[9], lut_val_0_n_7_pp[9],  lut_val_0_n_7_pp, 7'd0 };
assign lut_0_bit_8_fill = {lut_val_0_n_8_pp[9], lut_val_0_n_8_pp[9], lut_val_0_n_8_pp[9], lut_val_0_n_8_pp[9],  lut_val_0_n_8_pp, 8'd0 };
assign lut_0_bit_9_fill = {lut_val_0_n_9_pp[9], lut_val_0_n_9_pp[9], lut_val_0_n_9_pp[9],  lut_val_0_n_9_pp, 9'd0 };
assign lut_0_bit_10_fill = {lut_val_0_n_10_pp[9], lut_val_0_n_10_pp[9],  lut_val_0_n_10_pp, 10'd0 };
assign lut_0_bit_11_fill = {lut_val_0_n_11_pp[9],  lut_val_0_n_11_pp, 11'd0 };
assign lut_0_bit_12_fill = { lut_val_0_n_12_pp, 12'd0 };
wire [22:0] tree_0_pp_l_0_n_0_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_0_fill), .bin(lut_0_bit_1_fill), .res(tree_0_pp_l_0_n_0_n) );
defparam Uadd_0_lut_l_0_n_0_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_0_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_1_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_2_fill), .bin(lut_0_bit_3_fill), .res(tree_0_pp_l_0_n_1_n) );
defparam Uadd_0_lut_l_0_n_1_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_1_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_2_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_2_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_4_fill), .bin(lut_0_bit_5_fill), .res(tree_0_pp_l_0_n_2_n) );
defparam Uadd_0_lut_l_0_n_2_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_2_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_3_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_3_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_6_fill), .bin(lut_0_bit_7_fill), .res(tree_0_pp_l_0_n_3_n) );
defparam Uadd_0_lut_l_0_n_3_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_3_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_4_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_4_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_8_fill), .bin(lut_0_bit_9_fill), .res(tree_0_pp_l_0_n_4_n) );
defparam Uadd_0_lut_l_0_n_4_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_4_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_5_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_5_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_10_fill), .bin(lut_0_bit_11_fill), .res(tree_0_pp_l_0_n_5_n) );
defparam Uadd_0_lut_l_0_n_5_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_5_n.PIPE_DEPTH = 1;
wire [22:0] tree_0_pp_l_0_n_6_n;
sadd_lpm_cen Uadd_0_lut_l_0_n_6_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_0_bit_12_fill), .bin(22'd0), .res(tree_0_pp_l_0_n_6_n) );
defparam Uadd_0_lut_l_0_n_6_n.IN_WIDTH = 22;
defparam Uadd_0_lut_l_0_n_6_n.PIPE_DEPTH = 1;

wire [23:0] tree_0_pp_l_1_n_0_n;
sadd_lpm_cen Uadd_0_lut_l_1_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_0_n_0_n), .bin(tree_0_pp_l_0_n_1_n), .res(tree_0_pp_l_1_n_0_n) );
defparam Uadd_0_lut_l_1_n_0_n.IN_WIDTH = 23;
defparam Uadd_0_lut_l_1_n_0_n.PIPE_DEPTH = 1;
wire [23:0] tree_0_pp_l_1_n_1_n;
sadd_lpm_cen Uadd_0_lut_l_1_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_0_n_2_n), .bin(tree_0_pp_l_0_n_3_n), .res(tree_0_pp_l_1_n_1_n) );
defparam Uadd_0_lut_l_1_n_1_n.IN_WIDTH = 23;
defparam Uadd_0_lut_l_1_n_1_n.PIPE_DEPTH = 1;
wire [23:0] tree_0_pp_l_1_n_2_n;
sadd_lpm_cen Uadd_0_lut_l_1_n_2_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_0_n_4_n), .bin(tree_0_pp_l_0_n_5_n), .res(tree_0_pp_l_1_n_2_n) );
defparam Uadd_0_lut_l_1_n_2_n.IN_WIDTH = 23;
defparam Uadd_0_lut_l_1_n_2_n.PIPE_DEPTH = 1;
wire [23:0] tree_0_pp_l_1_n_3_n;
sadd_lpm_cen Uadd_0_lut_l_1_n_3_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_0_n_6_n), .bin(23'd0), .res(tree_0_pp_l_1_n_3_n) );
defparam Uadd_0_lut_l_1_n_3_n.IN_WIDTH = 23;
defparam Uadd_0_lut_l_1_n_3_n.PIPE_DEPTH = 1;

wire [24:0] tree_0_pp_l_2_n_0_n;
sadd_lpm_cen Uadd_0_lut_l_2_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_1_n_0_n), .bin(tree_0_pp_l_1_n_1_n), .res(tree_0_pp_l_2_n_0_n) );
defparam Uadd_0_lut_l_2_n_0_n.IN_WIDTH = 24;
defparam Uadd_0_lut_l_2_n_0_n.PIPE_DEPTH = 1;
wire [24:0] tree_0_pp_l_2_n_1_n;
sadd_lpm_cen Uadd_0_lut_l_2_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_1_n_2_n), .bin(tree_0_pp_l_1_n_3_n), .res(tree_0_pp_l_2_n_1_n) );
defparam Uadd_0_lut_l_2_n_1_n.IN_WIDTH = 24;
defparam Uadd_0_lut_l_2_n_1_n.PIPE_DEPTH = 1;

wire [25:0] tree_0_pp_l_3_n_0_n;
sadd_lpm_cen Uadd_0_lut_l_3_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_0_pp_l_2_n_0_n), .bin(tree_0_pp_l_2_n_1_n), .res(tree_0_pp_l_3_n_0_n) );
defparam Uadd_0_lut_l_3_n_0_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_3_n_0_n.PIPE_DEPTH = 1;

wire [25:0] lut_val_0_n;
assign lut_val_0_n=tree_0_pp_l_3_n_0_n;


// ---- final adder tree ----

wire [26:0] fin_atree_l_0_n_0_n;
sadd_lpm_cen Uadd_cen_l_0_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_0_n), .bin(26'd0), .res(fin_atree_l_0_n_0_n) );
defparam Uadd_cen_l_0_n_0_n.IN_WIDTH = 26;
defparam Uadd_cen_l_0_n_0_n.PIPE_DEPTH = 1;

wire [26:0] mac_res;
assign mac_res=fin_atree_l_0_n_0_n;
wire [26:0] atree_res;
mac_tl Umtl (.clk(clk), 
             .data_in(mac_res),
             .data_out(atree_res));
defparam Umtl.DATA_WIDTH = 27;

// ---- Adder Tree Complete ---- 
wire [20:0] fir_int_res;
assign fir_int_res = atree_res [20:0];

// ---- Limiting Precision ---- 
wire [20:0]fir_int_res_fill;
assign fir_int_res_fill =  fir_int_res[20 :0];
parameter TOT_WIDTH = ACCUM_WIDTH;
assign fir_result = fir_int_res_fill[TOT_WIDTH-MSB_RM-1:LSB_RM];


wire pre_rdy;
assign rdy_to_ld = pre_rdy;
assign done = done_int;
par_ctrl Uctrl(.rst(rst),
		.clk(clk),
		.clk_en(clk_en),
		.done(done_int),
		.rdy_int(rdy_int),
		.rdy_to_ld(pre_rdy));
defparam Uctrl.REG_LEN = 8;
defparam Uctrl.REG_BIT = 4;
defparam Uctrl.CH_WIDTH =0; 
defparam Uctrl.NUM_CH =1; 
endmodule
