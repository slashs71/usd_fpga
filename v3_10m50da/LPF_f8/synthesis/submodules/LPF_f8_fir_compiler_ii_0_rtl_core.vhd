-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from LPF_f8_fir_compiler_ii_0_rtl_core
-- VHDL created on Sat May 01 21:36:04 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity LPF_f8_fir_compiler_ii_0_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(11 downto 0);  -- sfix12
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(29 downto 0);  -- sfix30
        clk : in std_logic;
        areset : in std_logic
    );
end LPF_f8_fir_compiler_ii_0_rtl_core;

architecture normal of LPF_f8_fir_compiler_ii_0_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr7_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr20_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr21_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr22_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr23_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr24_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr25_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr25_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr27_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr28_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr29_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr30_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr31_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr33_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr34_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr35_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr36_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr37_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr38_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr39_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr40_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr41_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr42_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr43_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr44_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr44_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr45_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr46_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr47_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr47_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr48_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr49_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr49_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr50_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr50_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr51_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_sym_add0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add2_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add2_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add2_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add2_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add3_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add4_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add4_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add4_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add4_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add5_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add5_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add5_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add5_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add5_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add6_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add6_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add6_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add6_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add7_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add7_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add7_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add7_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add8_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add8_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add8_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add8_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add8_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add9_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add9_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add9_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add10_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add10_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add10_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add10_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add11_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add11_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add11_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add11_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add12_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add12_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add12_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add12_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add13_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add13_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add13_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add13_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add14_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add14_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add14_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add14_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add15_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add15_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add15_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add15_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add16_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add16_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add16_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add16_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add17_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add17_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add17_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add17_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add18_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add18_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add18_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add18_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add19_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add19_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add19_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add19_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add20_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add20_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add20_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add20_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add21_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add21_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add21_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add21_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add21_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add22_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add22_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add22_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add22_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add23_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add23_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add23_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add23_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add23_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add24_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add24_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add24_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_sym_add24_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_sym_add24_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_11_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_7_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_10_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_10_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_10_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_10_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_11_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_11_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_11_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_11_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_12_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_12_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_12_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_12_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_2_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add3_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_5_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_5_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_5_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_add_5_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_5_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_5_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_5_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_5_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_3_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_3_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_3_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift2_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift4_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift6_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift6_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift2_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift6_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_mtree_mult1_25_shift0(BITSHIFT,184)@14
    u0_m0_wo0_mtree_mult1_25_shift0_qint <= u0_m0_wo0_sym_add0_q & "0000000";
    u0_m0_wo0_mtree_mult1_25_shift0_q <= u0_m0_wo0_mtree_mult1_25_shift0_qint(19 downto 0);

    -- d_u0_m0_wo0_memread_q_12(DELAY,458)@10 + 2
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,459)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_12_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,460)@10 + 2
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,461)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@10
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,33)@10
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,34)@10
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,35)@10
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,36)@10
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,37)@10
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,38)@10
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr20(DELAY,39)@10
    u0_m0_wo0_wi0_r0_delayr20 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => u0_m0_wo0_wi0_r0_delayr20_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr21(DELAY,40)@10
    u0_m0_wo0_wi0_r0_delayr21 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => u0_m0_wo0_wi0_r0_delayr21_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr22(DELAY,41)@10
    u0_m0_wo0_wi0_r0_delayr22 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => u0_m0_wo0_wi0_r0_delayr22_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr23(DELAY,42)@10
    u0_m0_wo0_wi0_r0_delayr23 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr22_q, xout => u0_m0_wo0_wi0_r0_delayr23_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr24(DELAY,43)@10
    u0_m0_wo0_wi0_r0_delayr24 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr23_q, xout => u0_m0_wo0_wi0_r0_delayr24_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr25(DELAY,44)@10
    u0_m0_wo0_wi0_r0_delayr25 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr24_q, xout => u0_m0_wo0_wi0_r0_delayr25_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr27(DELAY,46)@10
    u0_m0_wo0_wi0_r0_delayr27 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => u0_m0_wo0_wi0_r0_delayr27_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr28(DELAY,47)@10
    u0_m0_wo0_wi0_r0_delayr28 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr27_q, xout => u0_m0_wo0_wi0_r0_delayr28_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr29(DELAY,48)@10
    u0_m0_wo0_wi0_r0_delayr29 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr28_q, xout => u0_m0_wo0_wi0_r0_delayr29_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr30(DELAY,49)@10
    u0_m0_wo0_wi0_r0_delayr30 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr29_q, xout => u0_m0_wo0_wi0_r0_delayr30_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr31(DELAY,50)@10
    u0_m0_wo0_wi0_r0_delayr31 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr30_q, xout => u0_m0_wo0_wi0_r0_delayr31_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr32(DELAY,51)@10
    u0_m0_wo0_wi0_r0_delayr32 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr31_q, xout => u0_m0_wo0_wi0_r0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr33(DELAY,52)@10
    u0_m0_wo0_wi0_r0_delayr33 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr32_q, xout => u0_m0_wo0_wi0_r0_delayr33_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr34(DELAY,53)@10
    u0_m0_wo0_wi0_r0_delayr34 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr33_q, xout => u0_m0_wo0_wi0_r0_delayr34_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr35(DELAY,54)@10
    u0_m0_wo0_wi0_r0_delayr35 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr34_q, xout => u0_m0_wo0_wi0_r0_delayr35_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr36(DELAY,55)@10
    u0_m0_wo0_wi0_r0_delayr36 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr35_q, xout => u0_m0_wo0_wi0_r0_delayr36_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr37(DELAY,56)@10
    u0_m0_wo0_wi0_r0_delayr37 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr36_q, xout => u0_m0_wo0_wi0_r0_delayr37_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr38(DELAY,57)@10
    u0_m0_wo0_wi0_r0_delayr38 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr37_q, xout => u0_m0_wo0_wi0_r0_delayr38_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr39(DELAY,58)@10
    u0_m0_wo0_wi0_r0_delayr39 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr38_q, xout => u0_m0_wo0_wi0_r0_delayr39_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr40(DELAY,59)@10
    u0_m0_wo0_wi0_r0_delayr40 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr39_q, xout => u0_m0_wo0_wi0_r0_delayr40_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr41(DELAY,60)@10
    u0_m0_wo0_wi0_r0_delayr41 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr40_q, xout => u0_m0_wo0_wi0_r0_delayr41_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr42(DELAY,61)@10
    u0_m0_wo0_wi0_r0_delayr42 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr41_q, xout => u0_m0_wo0_wi0_r0_delayr42_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr43(DELAY,62)@10
    u0_m0_wo0_wi0_r0_delayr43 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr42_q, xout => u0_m0_wo0_wi0_r0_delayr43_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr44(DELAY,63)@10
    u0_m0_wo0_wi0_r0_delayr44 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr43_q, xout => u0_m0_wo0_wi0_r0_delayr44_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr45(DELAY,64)@10
    u0_m0_wo0_wi0_r0_delayr45 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr44_q, xout => u0_m0_wo0_wi0_r0_delayr45_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr46(DELAY,65)@10
    u0_m0_wo0_wi0_r0_delayr46 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr45_q, xout => u0_m0_wo0_wi0_r0_delayr46_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr47(DELAY,66)@10
    u0_m0_wo0_wi0_r0_delayr47 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr46_q, xout => u0_m0_wo0_wi0_r0_delayr47_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr48(DELAY,67)@10
    u0_m0_wo0_wi0_r0_delayr48 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr47_q, xout => u0_m0_wo0_wi0_r0_delayr48_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr49(DELAY,68)@10
    u0_m0_wo0_wi0_r0_delayr49 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr48_q, xout => u0_m0_wo0_wi0_r0_delayr49_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr49_q_12(DELAY,470)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr49_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr49_q, xout => d_u0_m0_wo0_wi0_r0_delayr49_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr50(DELAY,69)@12
    u0_m0_wo0_wi0_r0_delayr50 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr49_q_12_q, xout => u0_m0_wo0_wi0_r0_delayr50_q, ena => d_u0_m0_wo0_compute_q_12_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr50_q_13(DELAY,471)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr50_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr50_q, xout => d_u0_m0_wo0_wi0_r0_delayr50_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr51(DELAY,70)@13
    u0_m0_wo0_wi0_r0_delayr51 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr50_q_13_q, xout => u0_m0_wo0_wi0_r0_delayr51_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_13(DELAY,463)@10 + 3
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add0(ADD,100)@13 + 1
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q(11)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q));
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr51_q(11)) & u0_m0_wo0_wi0_r0_delayr51_q));
    u0_m0_wo0_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_25_add_1(ADD,185)@14 + 1
    u0_m0_wo0_mtree_mult1_25_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 13 => u0_m0_wo0_sym_add0_q(12)) & u0_m0_wo0_sym_add0_q));
    u0_m0_wo0_mtree_mult1_25_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_25_shift0_q(19)) & u0_m0_wo0_mtree_mult1_25_shift0_q));
    u0_m0_wo0_mtree_mult1_25_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_25_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_25_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_add_1_q <= u0_m0_wo0_mtree_mult1_25_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift2(BITSHIFT,188)@13
    u0_m0_wo0_mtree_mult1_24_shift2_qint <= u0_m0_wo0_sym_add1_q & "0";
    u0_m0_wo0_mtree_mult1_24_shift2_q <= u0_m0_wo0_mtree_mult1_24_shift2_qint(13 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_12(DELAY,464)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr1_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add1(ADD,101)@12 + 1
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr50_q(11)) & u0_m0_wo0_wi0_r0_delayr50_q));
    u0_m0_wo0_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_add_3(ADD,189)@13 + 1
    u0_m0_wo0_mtree_mult1_24_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_sym_add1_q(12)) & u0_m0_wo0_sym_add1_q));
    u0_m0_wo0_mtree_mult1_24_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_24_shift2_q(13)) & u0_m0_wo0_mtree_mult1_24_shift2_q));
    u0_m0_wo0_mtree_mult1_24_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_24_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_add_3_q <= u0_m0_wo0_mtree_mult1_24_add_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift4(BITSHIFT,190)@14
    u0_m0_wo0_mtree_mult1_24_shift4_qint <= u0_m0_wo0_mtree_mult1_24_add_3_q & "0000";
    u0_m0_wo0_mtree_mult1_24_shift4_q <= u0_m0_wo0_mtree_mult1_24_shift4_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift0(BITSHIFT,186)@13
    u0_m0_wo0_mtree_mult1_24_shift0_qint <= u0_m0_wo0_sym_add1_q & "00";
    u0_m0_wo0_mtree_mult1_24_shift0_q <= u0_m0_wo0_mtree_mult1_24_shift0_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_add_1(ADD,187)@13 + 1
    u0_m0_wo0_mtree_mult1_24_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_sym_add1_q(12)) & u0_m0_wo0_sym_add1_q));
    u0_m0_wo0_mtree_mult1_24_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_24_shift0_q(14)) & u0_m0_wo0_mtree_mult1_24_shift0_q));
    u0_m0_wo0_mtree_mult1_24_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_24_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_add_1_q <= u0_m0_wo0_mtree_mult1_24_add_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_add_5(ADD,191)@14 + 1
    u0_m0_wo0_mtree_mult1_24_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_mtree_mult1_24_add_1_q(15)) & u0_m0_wo0_mtree_mult1_24_add_1_q));
    u0_m0_wo0_mtree_mult1_24_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_24_shift4_q(18)) & u0_m0_wo0_mtree_mult1_24_shift4_q));
    u0_m0_wo0_mtree_mult1_24_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_24_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_add_5_q <= u0_m0_wo0_mtree_mult1_24_add_5_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift6(BITSHIFT,192)@15
    u0_m0_wo0_mtree_mult1_24_shift6_qint <= u0_m0_wo0_mtree_mult1_24_add_5_q & "0";
    u0_m0_wo0_mtree_mult1_24_shift6_q <= u0_m0_wo0_mtree_mult1_24_shift6_qint(20 downto 0);

    -- u0_m0_wo0_mtree_add0_12(ADD,164)@15 + 1
    u0_m0_wo0_mtree_add0_12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_24_shift6_q(20)) & u0_m0_wo0_mtree_mult1_24_shift6_q));
    u0_m0_wo0_mtree_add0_12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_25_add_1_q(20)) & u0_m0_wo0_mtree_mult1_25_add_1_q));
    u0_m0_wo0_mtree_add0_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_12_a) + SIGNED(u0_m0_wo0_mtree_add0_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_12_q <= u0_m0_wo0_mtree_add0_12_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift2(BITSHIFT,195)@11
    u0_m0_wo0_mtree_mult1_23_shift2_qint <= u0_m0_wo0_sym_add2_q & "000";
    u0_m0_wo0_mtree_mult1_23_shift2_q <= u0_m0_wo0_mtree_mult1_23_shift2_qint(15 downto 0);

    -- u0_m0_wo0_sym_add2(ADD,102)@10 + 1
    u0_m0_wo0_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr2_q(11)) & u0_m0_wo0_wi0_r0_delayr2_q));
    u0_m0_wo0_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr49_q(11)) & u0_m0_wo0_wi0_r0_delayr49_q));
    u0_m0_wo0_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add2_a) + SIGNED(u0_m0_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add2_q <= u0_m0_wo0_sym_add2_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_3(ADD,196)@11 + 1
    u0_m0_wo0_mtree_mult1_23_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo0_sym_add2_q(12)) & u0_m0_wo0_sym_add2_q));
    u0_m0_wo0_mtree_mult1_23_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_23_shift2_q(15)) & u0_m0_wo0_mtree_mult1_23_shift2_q));
    u0_m0_wo0_mtree_mult1_23_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_3_q <= u0_m0_wo0_mtree_mult1_23_add_3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift4(BITSHIFT,197)@12
    u0_m0_wo0_mtree_mult1_23_shift4_qint <= u0_m0_wo0_mtree_mult1_23_add_3_q & "0000";
    u0_m0_wo0_mtree_mult1_23_shift4_q <= u0_m0_wo0_mtree_mult1_23_shift4_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift0(BITSHIFT,193)@11
    u0_m0_wo0_mtree_mult1_23_shift0_qint <= u0_m0_wo0_sym_add2_q & "0";
    u0_m0_wo0_mtree_mult1_23_shift0_q <= u0_m0_wo0_mtree_mult1_23_shift0_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_1(ADD,194)@11 + 1
    u0_m0_wo0_mtree_mult1_23_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_sym_add2_q(12)) & u0_m0_wo0_sym_add2_q));
    u0_m0_wo0_mtree_mult1_23_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_23_shift0_q(13)) & u0_m0_wo0_mtree_mult1_23_shift0_q));
    u0_m0_wo0_mtree_mult1_23_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_1_q <= u0_m0_wo0_mtree_mult1_23_add_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_5(ADD,198)@12 + 1
    u0_m0_wo0_mtree_mult1_23_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 15 => u0_m0_wo0_mtree_mult1_23_add_1_q(14)) & u0_m0_wo0_mtree_mult1_23_add_1_q));
    u0_m0_wo0_mtree_mult1_23_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_23_shift4_q(20)) & u0_m0_wo0_mtree_mult1_23_shift4_q));
    u0_m0_wo0_mtree_mult1_23_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_5_q <= u0_m0_wo0_mtree_mult1_23_add_5_o(21 downto 0);

    -- u0_m0_wo0_sym_add3(ADD,103)@10 + 1
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr3_q(11)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr48_q(11)) & u0_m0_wo0_wi0_r0_delayr48_q));
    u0_m0_wo0_sym_add3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(12 downto 0);

    -- d_u0_m0_wo0_sym_add3_q_12(DELAY,472)@11 + 1
    d_u0_m0_wo0_sym_add3_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add3_q, xout => d_u0_m0_wo0_sym_add3_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_22_shift2(BITSHIFT,201)@12
    u0_m0_wo0_mtree_mult1_22_shift2_qint <= d_u0_m0_wo0_sym_add3_q_12_q & "00000";
    u0_m0_wo0_mtree_mult1_22_shift2_q <= u0_m0_wo0_mtree_mult1_22_shift2_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_shift0(BITSHIFT,199)@11
    u0_m0_wo0_mtree_mult1_22_shift0_qint <= u0_m0_wo0_sym_add3_q & "0000";
    u0_m0_wo0_mtree_mult1_22_shift0_q <= u0_m0_wo0_mtree_mult1_22_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_add_1(ADD,200)@11 + 1
    u0_m0_wo0_mtree_mult1_22_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo0_sym_add3_q(12)) & u0_m0_wo0_sym_add3_q));
    u0_m0_wo0_mtree_mult1_22_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_22_shift0_q(16)) & u0_m0_wo0_mtree_mult1_22_shift0_q));
    u0_m0_wo0_mtree_mult1_22_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_22_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_22_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_22_add_1_q <= u0_m0_wo0_mtree_mult1_22_add_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_add_3(ADD,202)@12 + 1
    u0_m0_wo0_mtree_mult1_22_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_22_add_1_q(17)) & u0_m0_wo0_mtree_mult1_22_add_1_q));
    u0_m0_wo0_mtree_mult1_22_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_22_shift2_q(17)) & u0_m0_wo0_mtree_mult1_22_shift2_q));
    u0_m0_wo0_mtree_mult1_22_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_22_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_22_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_22_add_3_q <= u0_m0_wo0_mtree_mult1_22_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_shift4(BITSHIFT,203)@13
    u0_m0_wo0_mtree_mult1_22_shift4_qint <= u0_m0_wo0_mtree_mult1_22_add_3_q & "00";
    u0_m0_wo0_mtree_mult1_22_shift4_q <= u0_m0_wo0_mtree_mult1_22_shift4_qint(20 downto 0);

    -- u0_m0_wo0_mtree_add0_11(ADD,163)@13 + 1
    u0_m0_wo0_mtree_add0_11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo0_mtree_mult1_22_shift4_q(20)) & u0_m0_wo0_mtree_mult1_22_shift4_q));
    u0_m0_wo0_mtree_add0_11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_23_add_5_q(21)) & u0_m0_wo0_mtree_mult1_23_add_5_q));
    u0_m0_wo0_mtree_add0_11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_11_a) + SIGNED(u0_m0_wo0_mtree_add0_11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_11_q <= u0_m0_wo0_mtree_add0_11_o(22 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr47_q_11(DELAY,469)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr47_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr47_q, xout => d_u0_m0_wo0_wi0_r0_delayr47_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_11(DELAY,465)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add4(ADD,104)@11 + 1
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr4_q_11_q));
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr47_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr47_q_11_q));
    u0_m0_wo0_sym_add4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_shift0(BITSHIFT,204)@12
    u0_m0_wo0_mtree_mult1_21_shift0_qint <= u0_m0_wo0_sym_add4_q & "0000000";
    u0_m0_wo0_mtree_mult1_21_shift0_q <= u0_m0_wo0_mtree_mult1_21_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_sub_1(SUB,205)@12 + 1
    u0_m0_wo0_mtree_mult1_21_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_21_shift0_q(19)) & u0_m0_wo0_mtree_mult1_21_shift0_q));
    u0_m0_wo0_mtree_mult1_21_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 13 => u0_m0_wo0_sym_add4_q(12)) & u0_m0_wo0_sym_add4_q));
    u0_m0_wo0_mtree_mult1_21_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_21_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_sub_1_q <= u0_m0_wo0_mtree_mult1_21_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_shift2(BITSHIFT,206)@13
    u0_m0_wo0_mtree_mult1_21_shift2_qint <= u0_m0_wo0_mtree_mult1_21_sub_1_q & "0";
    u0_m0_wo0_mtree_mult1_21_shift2_q <= u0_m0_wo0_mtree_mult1_21_shift2_qint(21 downto 0);

    -- u0_m0_wo0_sym_add5(ADD,105)@10 + 1
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr5_q(11)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr46_q(11)) & u0_m0_wo0_wi0_r0_delayr46_q));
    u0_m0_wo0_sym_add5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(12 downto 0);

    -- d_u0_m0_wo0_sym_add5_q_12(DELAY,473)@11 + 1
    d_u0_m0_wo0_sym_add5_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add5_q, xout => d_u0_m0_wo0_sym_add5_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_20_shift2(BITSHIFT,209)@12
    u0_m0_wo0_mtree_mult1_20_shift2_qint <= d_u0_m0_wo0_sym_add5_q_12_q & "00000000";
    u0_m0_wo0_mtree_mult1_20_shift2_q <= u0_m0_wo0_mtree_mult1_20_shift2_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_20_shift0(BITSHIFT,207)@11
    u0_m0_wo0_mtree_mult1_20_shift0_qint <= u0_m0_wo0_sym_add5_q & "000000";
    u0_m0_wo0_mtree_mult1_20_shift0_q <= u0_m0_wo0_mtree_mult1_20_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_20_add_1(ADD,208)@11 + 1
    u0_m0_wo0_mtree_mult1_20_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 13 => u0_m0_wo0_sym_add5_q(12)) & u0_m0_wo0_sym_add5_q));
    u0_m0_wo0_mtree_mult1_20_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_20_shift0_q(18)) & u0_m0_wo0_mtree_mult1_20_shift0_q));
    u0_m0_wo0_mtree_mult1_20_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_20_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_20_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_add_1_q <= u0_m0_wo0_mtree_mult1_20_add_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_20_add_3(ADD,210)@12 + 1
    u0_m0_wo0_mtree_mult1_20_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => u0_m0_wo0_mtree_mult1_20_add_1_q(19)) & u0_m0_wo0_mtree_mult1_20_add_1_q));
    u0_m0_wo0_mtree_mult1_20_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_20_shift2_q(20)) & u0_m0_wo0_mtree_mult1_20_shift2_q));
    u0_m0_wo0_mtree_mult1_20_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_20_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_20_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_add_3_q <= u0_m0_wo0_mtree_mult1_20_add_3_o(21 downto 0);

    -- u0_m0_wo0_mtree_add0_10(ADD,162)@13 + 1
    u0_m0_wo0_mtree_add0_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_20_add_3_q(21)) & u0_m0_wo0_mtree_mult1_20_add_3_q));
    u0_m0_wo0_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_21_shift2_q(21)) & u0_m0_wo0_mtree_mult1_21_shift2_q));
    u0_m0_wo0_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_10_a) + SIGNED(u0_m0_wo0_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_10_q <= u0_m0_wo0_mtree_add0_10_o(22 downto 0);

    -- u0_m0_wo0_mtree_add1_5(ADD,170)@14 + 1
    u0_m0_wo0_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo0_mtree_add0_10_q(22)) & u0_m0_wo0_mtree_add0_10_q));
    u0_m0_wo0_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo0_mtree_add0_11_q(22)) & u0_m0_wo0_mtree_add0_11_q));
    u0_m0_wo0_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_5_a) + SIGNED(u0_m0_wo0_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_5_q <= u0_m0_wo0_mtree_add1_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift2(BITSHIFT,213)@11
    u0_m0_wo0_mtree_mult1_19_shift2_qint <= u0_m0_wo0_sym_add6_q & "0";
    u0_m0_wo0_mtree_mult1_19_shift2_q <= u0_m0_wo0_mtree_mult1_19_shift2_qint(13 downto 0);

    -- u0_m0_wo0_sym_add6(ADD,106)@10 + 1
    u0_m0_wo0_sym_add6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr6_q(11)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo0_sym_add6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr45_q(11)) & u0_m0_wo0_wi0_r0_delayr45_q));
    u0_m0_wo0_sym_add6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add6_a) + SIGNED(u0_m0_wo0_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add6_q <= u0_m0_wo0_sym_add6_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_add_3(ADD,214)@11 + 1
    u0_m0_wo0_mtree_mult1_19_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_sym_add6_q(12)) & u0_m0_wo0_sym_add6_q));
    u0_m0_wo0_mtree_mult1_19_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_19_shift2_q(13)) & u0_m0_wo0_mtree_mult1_19_shift2_q));
    u0_m0_wo0_mtree_mult1_19_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_add_3_q <= u0_m0_wo0_mtree_mult1_19_add_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift4(BITSHIFT,215)@12
    u0_m0_wo0_mtree_mult1_19_shift4_qint <= u0_m0_wo0_mtree_mult1_19_add_3_q & "00000";
    u0_m0_wo0_mtree_mult1_19_shift4_q <= u0_m0_wo0_mtree_mult1_19_shift4_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift0(BITSHIFT,211)@11
    u0_m0_wo0_mtree_mult1_19_shift0_qint <= u0_m0_wo0_sym_add6_q & "0";
    u0_m0_wo0_mtree_mult1_19_shift0_q <= u0_m0_wo0_mtree_mult1_19_shift0_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_add_1(ADD,212)@11 + 1
    u0_m0_wo0_mtree_mult1_19_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_sym_add6_q(12)) & u0_m0_wo0_sym_add6_q));
    u0_m0_wo0_mtree_mult1_19_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_19_shift0_q(13)) & u0_m0_wo0_mtree_mult1_19_shift0_q));
    u0_m0_wo0_mtree_mult1_19_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_add_1_q <= u0_m0_wo0_mtree_mult1_19_add_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_add_5(ADD,216)@12 + 1
    u0_m0_wo0_mtree_mult1_19_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 15 => u0_m0_wo0_mtree_mult1_19_add_1_q(14)) & u0_m0_wo0_mtree_mult1_19_add_1_q));
    u0_m0_wo0_mtree_mult1_19_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_19_shift4_q(19)) & u0_m0_wo0_mtree_mult1_19_shift4_q));
    u0_m0_wo0_mtree_mult1_19_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_add_5_q <= u0_m0_wo0_mtree_mult1_19_add_5_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift6(BITSHIFT,217)@13
    u0_m0_wo0_mtree_mult1_19_shift6_qint <= u0_m0_wo0_mtree_mult1_19_add_5_q & "00";
    u0_m0_wo0_mtree_mult1_19_shift6_q <= u0_m0_wo0_mtree_mult1_19_shift6_qint(22 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr44_q_11(DELAY,468)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr44_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr44_q, xout => d_u0_m0_wo0_wi0_r0_delayr44_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr7_q_11(DELAY,466)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr7_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => d_u0_m0_wo0_wi0_r0_delayr7_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add7(ADD,107)@11 + 1
    u0_m0_wo0_sym_add7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr7_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr7_q_11_q));
    u0_m0_wo0_sym_add7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr44_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr44_q_11_q));
    u0_m0_wo0_sym_add7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add7_a) + SIGNED(u0_m0_wo0_sym_add7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add7_q <= u0_m0_wo0_sym_add7_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_18_shift0(BITSHIFT,218)@12
    u0_m0_wo0_mtree_mult1_18_shift0_qint <= u0_m0_wo0_sym_add7_q & "0000";
    u0_m0_wo0_mtree_mult1_18_shift0_q <= u0_m0_wo0_mtree_mult1_18_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_18_sub_1(SUB,219)@12 + 1
    u0_m0_wo0_mtree_mult1_18_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_18_shift0_q(16)) & u0_m0_wo0_mtree_mult1_18_shift0_q));
    u0_m0_wo0_mtree_mult1_18_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo0_sym_add7_q(12)) & u0_m0_wo0_sym_add7_q));
    u0_m0_wo0_mtree_mult1_18_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_18_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_18_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_18_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_18_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_18_sub_1_q <= u0_m0_wo0_mtree_mult1_18_sub_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_18_shift2(BITSHIFT,220)@13
    u0_m0_wo0_mtree_mult1_18_shift2_qint <= u0_m0_wo0_mtree_mult1_18_sub_1_q & "00000";
    u0_m0_wo0_mtree_mult1_18_shift2_q <= u0_m0_wo0_mtree_mult1_18_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_add0_9(ADD,161)@13 + 1
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_18_shift2_q(22)) & u0_m0_wo0_mtree_mult1_18_shift2_q));
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_19_shift6_q(22)) & u0_m0_wo0_mtree_mult1_19_shift6_q));
    u0_m0_wo0_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(23 downto 0);

    -- u0_m0_wo0_sym_add8(ADD,108)@10 + 1
    u0_m0_wo0_sym_add8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr8_q(11)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_sym_add8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr43_q(11)) & u0_m0_wo0_wi0_r0_delayr43_q));
    u0_m0_wo0_sym_add8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add8_a) + SIGNED(u0_m0_wo0_sym_add8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add8_q <= u0_m0_wo0_sym_add8_o(12 downto 0);

    -- d_u0_m0_wo0_sym_add8_q_12(DELAY,474)@11 + 1
    d_u0_m0_wo0_sym_add8_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add8_q, xout => d_u0_m0_wo0_sym_add8_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_17_shift2(BITSHIFT,223)@12
    u0_m0_wo0_mtree_mult1_17_shift2_qint <= d_u0_m0_wo0_sym_add8_q_12_q & "0000000";
    u0_m0_wo0_mtree_mult1_17_shift2_q <= u0_m0_wo0_mtree_mult1_17_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift0(BITSHIFT,221)@11
    u0_m0_wo0_mtree_mult1_17_shift0_qint <= u0_m0_wo0_sym_add8_q & "0000";
    u0_m0_wo0_mtree_mult1_17_shift0_q <= u0_m0_wo0_mtree_mult1_17_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_sub_1(SUB,222)@11 + 1
    u0_m0_wo0_mtree_mult1_17_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_17_shift0_q(16)) & u0_m0_wo0_mtree_mult1_17_shift0_q));
    u0_m0_wo0_mtree_mult1_17_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo0_sym_add8_q(12)) & u0_m0_wo0_sym_add8_q));
    u0_m0_wo0_mtree_mult1_17_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_17_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_sub_1_q <= u0_m0_wo0_mtree_mult1_17_sub_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_add_3(ADD,224)@12 + 1
    u0_m0_wo0_mtree_mult1_17_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo0_mtree_mult1_17_sub_1_q(17)) & u0_m0_wo0_mtree_mult1_17_sub_1_q));
    u0_m0_wo0_mtree_mult1_17_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_17_shift2_q(19)) & u0_m0_wo0_mtree_mult1_17_shift2_q));
    u0_m0_wo0_mtree_mult1_17_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_add_3_q <= u0_m0_wo0_mtree_mult1_17_add_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift4(BITSHIFT,225)@13
    u0_m0_wo0_mtree_mult1_17_shift4_qint <= u0_m0_wo0_mtree_mult1_17_add_3_q & "00";
    u0_m0_wo0_mtree_mult1_17_shift4_q <= u0_m0_wo0_mtree_mult1_17_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift2(BITSHIFT,228)@11
    u0_m0_wo0_mtree_mult1_16_shift2_qint <= u0_m0_wo0_sym_add9_q & "00";
    u0_m0_wo0_mtree_mult1_16_shift2_q <= u0_m0_wo0_mtree_mult1_16_shift2_qint(14 downto 0);

    -- u0_m0_wo0_sym_add9(ADD,109)@10 + 1
    u0_m0_wo0_sym_add9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr9_q(11)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo0_sym_add9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr42_q(11)) & u0_m0_wo0_wi0_r0_delayr42_q));
    u0_m0_wo0_sym_add9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add9_a) + SIGNED(u0_m0_wo0_sym_add9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add9_q <= u0_m0_wo0_sym_add9_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_add_3(ADD,229)@11 + 1
    u0_m0_wo0_mtree_mult1_16_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_sym_add9_q(12)) & u0_m0_wo0_sym_add9_q));
    u0_m0_wo0_mtree_mult1_16_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_16_shift2_q(14)) & u0_m0_wo0_mtree_mult1_16_shift2_q));
    u0_m0_wo0_mtree_mult1_16_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_16_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_add_3_q <= u0_m0_wo0_mtree_mult1_16_add_3_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift4(BITSHIFT,230)@12
    u0_m0_wo0_mtree_mult1_16_shift4_qint <= u0_m0_wo0_mtree_mult1_16_add_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_16_shift4_q <= u0_m0_wo0_mtree_mult1_16_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift0(BITSHIFT,226)@11
    u0_m0_wo0_mtree_mult1_16_shift0_qint <= u0_m0_wo0_sym_add9_q & "00000";
    u0_m0_wo0_mtree_mult1_16_shift0_q <= u0_m0_wo0_mtree_mult1_16_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_sub_1(SUB,227)@11 + 1
    u0_m0_wo0_mtree_mult1_16_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_16_shift0_q(17)) & u0_m0_wo0_mtree_mult1_16_shift0_q));
    u0_m0_wo0_mtree_mult1_16_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 13 => u0_m0_wo0_sym_add9_q(12)) & u0_m0_wo0_sym_add9_q));
    u0_m0_wo0_mtree_mult1_16_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_16_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_sub_1_q <= u0_m0_wo0_mtree_mult1_16_sub_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_add_5(ADD,231)@12 + 1
    u0_m0_wo0_mtree_mult1_16_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 19 => u0_m0_wo0_mtree_mult1_16_sub_1_q(18)) & u0_m0_wo0_mtree_mult1_16_sub_1_q));
    u0_m0_wo0_mtree_mult1_16_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_16_shift4_q(22)) & u0_m0_wo0_mtree_mult1_16_shift4_q));
    u0_m0_wo0_mtree_mult1_16_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_16_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_add_5_q <= u0_m0_wo0_mtree_mult1_16_add_5_o(23 downto 0);

    -- u0_m0_wo0_mtree_add0_8(ADD,160)@13 + 1
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_16_add_5_q(23)) & u0_m0_wo0_mtree_mult1_16_add_5_q));
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo0_mtree_mult1_17_shift4_q(22)) & u0_m0_wo0_mtree_mult1_17_shift4_q));
    u0_m0_wo0_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_4(ADD,169)@14 + 1
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_8_q(24)) & u0_m0_wo0_mtree_add0_8_q));
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo0_mtree_add0_9_q(23)) & u0_m0_wo0_mtree_add0_9_q));
    u0_m0_wo0_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(25 downto 0);

    -- u0_m0_wo0_mtree_add2_2(ADD,173)@15 + 1
    u0_m0_wo0_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_4_q(25)) & u0_m0_wo0_mtree_add1_4_q));
    u0_m0_wo0_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo0_mtree_add1_5_q(24)) & u0_m0_wo0_mtree_add1_5_q));
    u0_m0_wo0_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_2_a) + SIGNED(u0_m0_wo0_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_2_q <= u0_m0_wo0_mtree_add2_2_o(26 downto 0);

    -- u0_m0_wo0_mtree_add3_1(ADD,175)@16 + 1
    u0_m0_wo0_mtree_add3_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add2_2_q(26)) & u0_m0_wo0_mtree_add2_2_q));
    u0_m0_wo0_mtree_add3_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 22 => u0_m0_wo0_mtree_add0_12_q(21)) & u0_m0_wo0_mtree_add0_12_q));
    u0_m0_wo0_mtree_add3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_1_a) + SIGNED(u0_m0_wo0_mtree_add3_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_1_q <= u0_m0_wo0_mtree_add3_1_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_shift2(BITSHIFT,234)@11
    u0_m0_wo0_mtree_mult1_15_shift2_qint <= u0_m0_wo0_sym_add10_q & "0";
    u0_m0_wo0_mtree_mult1_15_shift2_q <= u0_m0_wo0_mtree_mult1_15_shift2_qint(13 downto 0);

    -- u0_m0_wo0_sym_add10(ADD,110)@10 + 1
    u0_m0_wo0_sym_add10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr10_q(11)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_sym_add10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr41_q(11)) & u0_m0_wo0_wi0_r0_delayr41_q));
    u0_m0_wo0_sym_add10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add10_a) + SIGNED(u0_m0_wo0_sym_add10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add10_q <= u0_m0_wo0_sym_add10_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_add_3(ADD,235)@11 + 1
    u0_m0_wo0_mtree_mult1_15_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_sym_add10_q(12)) & u0_m0_wo0_sym_add10_q));
    u0_m0_wo0_mtree_mult1_15_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_15_shift2_q(13)) & u0_m0_wo0_mtree_mult1_15_shift2_q));
    u0_m0_wo0_mtree_mult1_15_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_add_3_q <= u0_m0_wo0_mtree_mult1_15_add_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_shift4(BITSHIFT,236)@12
    u0_m0_wo0_mtree_mult1_15_shift4_qint <= u0_m0_wo0_mtree_mult1_15_add_3_q & "00000000";
    u0_m0_wo0_mtree_mult1_15_shift4_q <= u0_m0_wo0_mtree_mult1_15_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_shift0(BITSHIFT,232)@11
    u0_m0_wo0_mtree_mult1_15_shift0_qint <= u0_m0_wo0_sym_add10_q & "000";
    u0_m0_wo0_mtree_mult1_15_shift0_q <= u0_m0_wo0_mtree_mult1_15_shift0_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_add_1(ADD,233)@11 + 1
    u0_m0_wo0_mtree_mult1_15_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo0_sym_add10_q(12)) & u0_m0_wo0_sym_add10_q));
    u0_m0_wo0_mtree_mult1_15_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_15_shift0_q(15)) & u0_m0_wo0_mtree_mult1_15_shift0_q));
    u0_m0_wo0_mtree_mult1_15_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_add_1_q <= u0_m0_wo0_mtree_mult1_15_add_1_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_add_5(ADD,237)@12 + 1
    u0_m0_wo0_mtree_mult1_15_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 17 => u0_m0_wo0_mtree_mult1_15_add_1_q(16)) & u0_m0_wo0_mtree_mult1_15_add_1_q));
    u0_m0_wo0_mtree_mult1_15_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_15_shift4_q(22)) & u0_m0_wo0_mtree_mult1_15_shift4_q));
    u0_m0_wo0_mtree_mult1_15_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_add_5_q <= u0_m0_wo0_mtree_mult1_15_add_5_o(23 downto 0);

    -- u0_m0_wo0_sym_add11(ADD,111)@10 + 1
    u0_m0_wo0_sym_add11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr11_q(11)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo0_sym_add11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr40_q(11)) & u0_m0_wo0_wi0_r0_delayr40_q));
    u0_m0_wo0_sym_add11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add11_a) + SIGNED(u0_m0_wo0_sym_add11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add11_q <= u0_m0_wo0_sym_add11_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift2(BITSHIFT,240)@11
    u0_m0_wo0_mtree_mult1_14_shift2_qint <= u0_m0_wo0_sym_add11_q & "000";
    u0_m0_wo0_mtree_mult1_14_shift2_q <= u0_m0_wo0_mtree_mult1_14_shift2_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_sub_3(SUB,241)@11 + 1
    u0_m0_wo0_mtree_mult1_14_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_14_shift2_q(15)) & u0_m0_wo0_mtree_mult1_14_shift2_q));
    u0_m0_wo0_mtree_mult1_14_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo0_sym_add11_q(12)) & u0_m0_wo0_sym_add11_q));
    u0_m0_wo0_mtree_mult1_14_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_14_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_sub_3_q <= u0_m0_wo0_mtree_mult1_14_sub_3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift4(BITSHIFT,242)@12
    u0_m0_wo0_mtree_mult1_14_shift4_qint <= u0_m0_wo0_mtree_mult1_14_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_14_shift4_q <= u0_m0_wo0_mtree_mult1_14_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift0(BITSHIFT,238)@11
    u0_m0_wo0_mtree_mult1_14_shift0_qint <= u0_m0_wo0_sym_add11_q & "000";
    u0_m0_wo0_mtree_mult1_14_shift0_q <= u0_m0_wo0_mtree_mult1_14_shift0_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_sub_1(SUB,239)@11 + 1
    u0_m0_wo0_mtree_mult1_14_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo0_sym_add11_q(12)) & u0_m0_wo0_sym_add11_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_14_shift0_q(15)) & u0_m0_wo0_mtree_mult1_14_shift0_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_sub_1_q <= u0_m0_wo0_mtree_mult1_14_sub_1_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_add_5(ADD,243)@12 + 1
    u0_m0_wo0_mtree_mult1_14_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => u0_m0_wo0_mtree_mult1_14_sub_1_q(16)) & u0_m0_wo0_mtree_mult1_14_sub_1_q));
    u0_m0_wo0_mtree_mult1_14_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_14_shift4_q(23)) & u0_m0_wo0_mtree_mult1_14_shift4_q));
    u0_m0_wo0_mtree_mult1_14_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_14_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_add_5_q <= u0_m0_wo0_mtree_mult1_14_add_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_add0_7(ADD,159)@13 + 1
    u0_m0_wo0_mtree_add0_7_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_14_add_5_q);
    u0_m0_wo0_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_15_add_5_q(23)) & u0_m0_wo0_mtree_mult1_15_add_5_q));
    u0_m0_wo0_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_7_a) + SIGNED(u0_m0_wo0_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_q <= u0_m0_wo0_mtree_add0_7_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_shift0(BITSHIFT,244)@11
    u0_m0_wo0_mtree_mult1_13_shift0_qint <= u0_m0_wo0_sym_add12_q & "00";
    u0_m0_wo0_mtree_mult1_13_shift0_q <= u0_m0_wo0_mtree_mult1_13_shift0_qint(14 downto 0);

    -- u0_m0_wo0_sym_add12(ADD,112)@10 + 1
    u0_m0_wo0_sym_add12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr12_q(11)) & u0_m0_wo0_wi0_r0_delayr12_q));
    u0_m0_wo0_sym_add12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr39_q(11)) & u0_m0_wo0_wi0_r0_delayr39_q));
    u0_m0_wo0_sym_add12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add12_a) + SIGNED(u0_m0_wo0_sym_add12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add12_q <= u0_m0_wo0_sym_add12_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_add_1(ADD,245)@11 + 1
    u0_m0_wo0_mtree_mult1_13_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_sym_add12_q(12)) & u0_m0_wo0_sym_add12_q));
    u0_m0_wo0_mtree_mult1_13_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_13_shift0_q(14)) & u0_m0_wo0_mtree_mult1_13_shift0_q));
    u0_m0_wo0_mtree_mult1_13_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_add_1_q <= u0_m0_wo0_mtree_mult1_13_add_1_o(15 downto 0);

    -- d_u0_m0_wo0_sym_add12_q_12(DELAY,475)@11 + 1
    d_u0_m0_wo0_sym_add12_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add12_q, xout => d_u0_m0_wo0_sym_add12_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_13_shift2(BITSHIFT,246)@12
    u0_m0_wo0_mtree_mult1_13_shift2_qint <= d_u0_m0_wo0_sym_add12_q_12_q & "00000000";
    u0_m0_wo0_mtree_mult1_13_shift2_q <= u0_m0_wo0_mtree_mult1_13_shift2_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_sub_3(SUB,247)@12 + 1
    u0_m0_wo0_mtree_mult1_13_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_13_shift2_q(20)) & u0_m0_wo0_mtree_mult1_13_shift2_q));
    u0_m0_wo0_mtree_mult1_13_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_mtree_mult1_13_add_1_q(15)) & u0_m0_wo0_mtree_mult1_13_add_1_q));
    u0_m0_wo0_mtree_mult1_13_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_13_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_sub_3_q <= u0_m0_wo0_mtree_mult1_13_sub_3_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_shift4(BITSHIFT,248)@13
    u0_m0_wo0_mtree_mult1_13_shift4_qint <= u0_m0_wo0_mtree_mult1_13_sub_3_q & "00";
    u0_m0_wo0_mtree_mult1_13_shift4_q <= u0_m0_wo0_mtree_mult1_13_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_shift2(BITSHIFT,251)@11
    u0_m0_wo0_mtree_mult1_12_shift2_qint <= u0_m0_wo0_sym_add13_q & "0000";
    u0_m0_wo0_mtree_mult1_12_shift2_q <= u0_m0_wo0_mtree_mult1_12_shift2_qint(16 downto 0);

    -- u0_m0_wo0_sym_add13(ADD,113)@10 + 1
    u0_m0_wo0_sym_add13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr13_q(11)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo0_sym_add13_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr38_q(11)) & u0_m0_wo0_wi0_r0_delayr38_q));
    u0_m0_wo0_sym_add13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add13_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add13_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add13_a) + SIGNED(u0_m0_wo0_sym_add13_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add13_q <= u0_m0_wo0_sym_add13_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_add_3(ADD,252)@11 + 1
    u0_m0_wo0_mtree_mult1_12_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo0_sym_add13_q(12)) & u0_m0_wo0_sym_add13_q));
    u0_m0_wo0_mtree_mult1_12_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_12_shift2_q(16)) & u0_m0_wo0_mtree_mult1_12_shift2_q));
    u0_m0_wo0_mtree_mult1_12_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_12_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_add_3_q <= u0_m0_wo0_mtree_mult1_12_add_3_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_shift4(BITSHIFT,253)@12
    u0_m0_wo0_mtree_mult1_12_shift4_qint <= u0_m0_wo0_mtree_mult1_12_add_3_q & "000000";
    u0_m0_wo0_mtree_mult1_12_shift4_q <= u0_m0_wo0_mtree_mult1_12_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_shift0(BITSHIFT,249)@11
    u0_m0_wo0_mtree_mult1_12_shift0_qint <= u0_m0_wo0_sym_add13_q & "00000";
    u0_m0_wo0_mtree_mult1_12_shift0_q <= u0_m0_wo0_mtree_mult1_12_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_add_1(ADD,250)@11 + 1
    u0_m0_wo0_mtree_mult1_12_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 13 => u0_m0_wo0_sym_add13_q(12)) & u0_m0_wo0_sym_add13_q));
    u0_m0_wo0_mtree_mult1_12_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_12_shift0_q(17)) & u0_m0_wo0_mtree_mult1_12_shift0_q));
    u0_m0_wo0_mtree_mult1_12_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_12_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_add_1_q <= u0_m0_wo0_mtree_mult1_12_add_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_add_5(ADD,254)@12 + 1
    u0_m0_wo0_mtree_mult1_12_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo0_mtree_mult1_12_add_1_q(18)) & u0_m0_wo0_mtree_mult1_12_add_1_q));
    u0_m0_wo0_mtree_mult1_12_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_12_shift4_q(23)) & u0_m0_wo0_mtree_mult1_12_shift4_q));
    u0_m0_wo0_mtree_mult1_12_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_12_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_add_5_q <= u0_m0_wo0_mtree_mult1_12_add_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_add0_6(ADD,158)@13 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_12_add_5_q(24)) & u0_m0_wo0_mtree_mult1_12_add_5_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo0_mtree_mult1_13_shift4_q(23)) & u0_m0_wo0_mtree_mult1_13_shift4_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,168)@14 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_6_q(25)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo0_mtree_add0_7_q(24)) & u0_m0_wo0_mtree_add0_7_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(26 downto 0);

    -- u0_m0_wo0_sym_add14(ADD,114)@10 + 1
    u0_m0_wo0_sym_add14_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr14_q(11)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo0_sym_add14_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr37_q(11)) & u0_m0_wo0_wi0_r0_delayr37_q));
    u0_m0_wo0_sym_add14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add14_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add14_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add14_a) + SIGNED(u0_m0_wo0_sym_add14_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add14_q <= u0_m0_wo0_sym_add14_o(12 downto 0);

    -- u0_m0_wo0_cm14(CONSTANT,88)@0
    u0_m0_wo0_cm14_q <= "010011010111";

    -- u0_m0_wo0_mtree_mult1_11(MULT,140)@11 + 2
    u0_m0_wo0_mtree_mult1_11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_q);
    u0_m0_wo0_mtree_mult1_11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add14_q);
    u0_m0_wo0_mtree_mult1_11_reset <= areset;
    u0_m0_wo0_mtree_mult1_11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_11_a0,
        datab => u0_m0_wo0_mtree_mult1_11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_11_s1
    );
    u0_m0_wo0_mtree_mult1_11_q <= u0_m0_wo0_mtree_mult1_11_s1;

    -- u0_m0_wo0_sym_add15(ADD,115)@10 + 1
    u0_m0_wo0_sym_add15_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr15_q(11)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo0_sym_add15_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr36_q(11)) & u0_m0_wo0_wi0_r0_delayr36_q));
    u0_m0_wo0_sym_add15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add15_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add15_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add15_a) + SIGNED(u0_m0_wo0_sym_add15_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add15_q <= u0_m0_wo0_sym_add15_o(12 downto 0);

    -- u0_m0_wo0_cm15(CONSTANT,89)@0
    u0_m0_wo0_cm15_q <= "010101001011";

    -- u0_m0_wo0_mtree_mult1_10(MULT,141)@11 + 2
    u0_m0_wo0_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm15_q);
    u0_m0_wo0_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add15_q);
    u0_m0_wo0_mtree_mult1_10_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_10_a0,
        datab => u0_m0_wo0_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

    -- u0_m0_wo0_mtree_add0_5(ADD,157)@13 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_10_q(24)) & u0_m0_wo0_mtree_mult1_10_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_11_q(24)) & u0_m0_wo0_mtree_mult1_11_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(25 downto 0);

    -- u0_m0_wo0_sym_add16(ADD,116)@10 + 1
    u0_m0_wo0_sym_add16_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr16_q(11)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo0_sym_add16_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr35_q(11)) & u0_m0_wo0_wi0_r0_delayr35_q));
    u0_m0_wo0_sym_add16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add16_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add16_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add16_a) + SIGNED(u0_m0_wo0_sym_add16_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add16_q <= u0_m0_wo0_sym_add16_o(12 downto 0);

    -- u0_m0_wo0_cm16(CONSTANT,90)@0
    u0_m0_wo0_cm16_q <= "010110111101";

    -- u0_m0_wo0_mtree_mult1_9(MULT,142)@11 + 2
    u0_m0_wo0_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm16_q);
    u0_m0_wo0_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add16_q);
    u0_m0_wo0_mtree_mult1_9_reset <= areset;
    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_9_a0,
        datab => u0_m0_wo0_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

    -- u0_m0_wo0_sym_add17(ADD,117)@10 + 1
    u0_m0_wo0_sym_add17_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr17_q(11)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo0_sym_add17_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr34_q(11)) & u0_m0_wo0_wi0_r0_delayr34_q));
    u0_m0_wo0_sym_add17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add17_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add17_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add17_a) + SIGNED(u0_m0_wo0_sym_add17_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add17_q <= u0_m0_wo0_sym_add17_o(12 downto 0);

    -- u0_m0_wo0_cm17(CONSTANT,91)@0
    u0_m0_wo0_cm17_q <= "011000101001";

    -- u0_m0_wo0_mtree_mult1_8(MULT,143)@11 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add17_q);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4(ADD,156)@13 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_8_q(24)) & u0_m0_wo0_mtree_mult1_8_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_9_q(24)) & u0_m0_wo0_mtree_mult1_9_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,167)@14 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_4_q(25)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_5_q(25)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(26 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,172)@15 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add1_2_q(26)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add1_3_q(26)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(27 downto 0);

    -- u0_m0_wo0_sym_add18(ADD,118)@10 + 1
    u0_m0_wo0_sym_add18_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr18_q(11)) & u0_m0_wo0_wi0_r0_delayr18_q));
    u0_m0_wo0_sym_add18_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr33_q(11)) & u0_m0_wo0_wi0_r0_delayr33_q));
    u0_m0_wo0_sym_add18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add18_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add18_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add18_a) + SIGNED(u0_m0_wo0_sym_add18_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add18_q <= u0_m0_wo0_sym_add18_o(12 downto 0);

    -- u0_m0_wo0_cm18(CONSTANT,92)@0
    u0_m0_wo0_cm18_q <= "011010001110";

    -- u0_m0_wo0_mtree_mult1_7(MULT,144)@11 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm18_q);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add18_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- u0_m0_wo0_sym_add19(ADD,119)@10 + 1
    u0_m0_wo0_sym_add19_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr19_q(11)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo0_sym_add19_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr32_q(11)) & u0_m0_wo0_wi0_r0_delayr32_q));
    u0_m0_wo0_sym_add19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add19_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add19_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add19_a) + SIGNED(u0_m0_wo0_sym_add19_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add19_q <= u0_m0_wo0_sym_add19_o(12 downto 0);

    -- u0_m0_wo0_cm19(CONSTANT,93)@0
    u0_m0_wo0_cm19_q <= "011011101010";

    -- u0_m0_wo0_mtree_mult1_6(MULT,145)@11 + 2
    u0_m0_wo0_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm19_q);
    u0_m0_wo0_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add19_q);
    u0_m0_wo0_mtree_mult1_6_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_6_a0,
        datab => u0_m0_wo0_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

    -- u0_m0_wo0_mtree_add0_3(ADD,155)@13 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_6_q(24)) & u0_m0_wo0_mtree_mult1_6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_7_q(24)) & u0_m0_wo0_mtree_mult1_7_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(25 downto 0);

    -- u0_m0_wo0_sym_add20(ADD,120)@10 + 1
    u0_m0_wo0_sym_add20_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr20_q(11)) & u0_m0_wo0_wi0_r0_delayr20_q));
    u0_m0_wo0_sym_add20_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr31_q(11)) & u0_m0_wo0_wi0_r0_delayr31_q));
    u0_m0_wo0_sym_add20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add20_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add20_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add20_a) + SIGNED(u0_m0_wo0_sym_add20_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add20_q <= u0_m0_wo0_sym_add20_o(12 downto 0);

    -- u0_m0_wo0_cm20(CONSTANT,94)@0
    u0_m0_wo0_cm20_q <= "011100111011";

    -- u0_m0_wo0_mtree_mult1_5(MULT,146)@11 + 2
    u0_m0_wo0_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm20_q);
    u0_m0_wo0_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add20_q);
    u0_m0_wo0_mtree_mult1_5_reset <= areset;
    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 13,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_5_a0,
        datab => u0_m0_wo0_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

    -- u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,315)@11
    u0_m0_wo0_mtree_mult1_4_shift0_qint <= u0_m0_wo0_sym_add21_q & "0000000";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_qint(19 downto 0);

    -- u0_m0_wo0_sym_add21(ADD,121)@10 + 1
    u0_m0_wo0_sym_add21_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr21_q(11)) & u0_m0_wo0_wi0_r0_delayr21_q));
    u0_m0_wo0_sym_add21_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr30_q(11)) & u0_m0_wo0_wi0_r0_delayr30_q));
    u0_m0_wo0_sym_add21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add21_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add21_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add21_a) + SIGNED(u0_m0_wo0_sym_add21_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add21_q <= u0_m0_wo0_sym_add21_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_add_1(ADD,316)@11 + 1
    u0_m0_wo0_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 13 => u0_m0_wo0_sym_add21_q(12)) & u0_m0_wo0_sym_add21_q));
    u0_m0_wo0_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_4_shift0_q(19)) & u0_m0_wo0_mtree_mult1_4_shift0_q));
    u0_m0_wo0_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_1_q <= u0_m0_wo0_mtree_mult1_4_add_1_o(20 downto 0);

    -- d_u0_m0_wo0_sym_add21_q_12(DELAY,476)@11 + 1
    d_u0_m0_wo0_sym_add21_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add21_q, xout => d_u0_m0_wo0_sym_add21_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4_shift2(BITSHIFT,317)@12
    u0_m0_wo0_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_sym_add21_q_12_q & "00000000000";
    u0_m0_wo0_mtree_mult1_4_shift2_q <= u0_m0_wo0_mtree_mult1_4_shift2_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_3(SUB,318)@12 + 1
    u0_m0_wo0_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_4_shift2_q(23)) & u0_m0_wo0_mtree_mult1_4_shift2_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => u0_m0_wo0_mtree_mult1_4_add_1_q(20)) & u0_m0_wo0_mtree_mult1_4_add_1_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_3_q <= u0_m0_wo0_mtree_mult1_4_sub_3_o(24 downto 0);

    -- u0_m0_wo0_mtree_add0_2(ADD,154)@13 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_4_sub_3_q(24)) & u0_m0_wo0_mtree_mult1_4_sub_3_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_5_q(24)) & u0_m0_wo0_mtree_mult1_5_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,166)@14 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_2_q(25)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_3_q(25)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,319)@11
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_sym_add22_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(14 downto 0);

    -- u0_m0_wo0_sym_add22(ADD,122)@10 + 1
    u0_m0_wo0_sym_add22_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr22_q(11)) & u0_m0_wo0_wi0_r0_delayr22_q));
    u0_m0_wo0_sym_add22_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr29_q(11)) & u0_m0_wo0_wi0_r0_delayr29_q));
    u0_m0_wo0_sym_add22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add22_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add22_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add22_a) + SIGNED(u0_m0_wo0_sym_add22_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add22_q <= u0_m0_wo0_sym_add22_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_1(ADD,320)@11 + 1
    u0_m0_wo0_mtree_mult1_3_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_sym_add22_q(12)) & u0_m0_wo0_sym_add22_q));
    u0_m0_wo0_mtree_mult1_3_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_3_shift0_q(14)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_1_q <= u0_m0_wo0_mtree_mult1_3_add_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,321)@11
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= u0_m0_wo0_sym_add22_q & "00000";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_3(SUB,322)@11 + 1
    u0_m0_wo0_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_3_shift2_q(17)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 13 => u0_m0_wo0_sym_add22_q(12)) & u0_m0_wo0_sym_add22_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_3_q <= u0_m0_wo0_mtree_mult1_3_sub_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift4(BITSHIFT,323)@12
    u0_m0_wo0_mtree_mult1_3_shift4_qint <= u0_m0_wo0_mtree_mult1_3_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_3_shift4_q <= u0_m0_wo0_mtree_mult1_3_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_5(SUB,324)@12 + 1
    u0_m0_wo0_mtree_mult1_3_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_3_shift4_q(23)) & u0_m0_wo0_mtree_mult1_3_shift4_q));
    u0_m0_wo0_mtree_mult1_3_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 16 => u0_m0_wo0_mtree_mult1_3_add_1_q(15)) & u0_m0_wo0_mtree_mult1_3_add_1_q));
    u0_m0_wo0_mtree_mult1_3_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_5_q <= u0_m0_wo0_mtree_mult1_3_sub_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift6(BITSHIFT,325)@13
    u0_m0_wo0_mtree_mult1_3_shift6_qint <= u0_m0_wo0_mtree_mult1_3_sub_5_q & "0";
    u0_m0_wo0_mtree_mult1_3_shift6_q <= u0_m0_wo0_mtree_mult1_3_shift6_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift0(BITSHIFT,326)@11
    u0_m0_wo0_mtree_mult1_2_shift0_qint <= u0_m0_wo0_sym_add23_q & "0000";
    u0_m0_wo0_mtree_mult1_2_shift0_q <= u0_m0_wo0_mtree_mult1_2_shift0_qint(16 downto 0);

    -- u0_m0_wo0_sym_add23(ADD,123)@10 + 1
    u0_m0_wo0_sym_add23_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr23_q(11)) & u0_m0_wo0_wi0_r0_delayr23_q));
    u0_m0_wo0_sym_add23_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr28_q(11)) & u0_m0_wo0_wi0_r0_delayr28_q));
    u0_m0_wo0_sym_add23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add23_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add23_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add23_a) + SIGNED(u0_m0_wo0_sym_add23_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add23_q <= u0_m0_wo0_sym_add23_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_add_1(ADD,327)@11 + 1
    u0_m0_wo0_mtree_mult1_2_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo0_sym_add23_q(12)) & u0_m0_wo0_sym_add23_q));
    u0_m0_wo0_mtree_mult1_2_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_2_shift0_q(16)) & u0_m0_wo0_mtree_mult1_2_shift0_q));
    u0_m0_wo0_mtree_mult1_2_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_add_1_q <= u0_m0_wo0_mtree_mult1_2_add_1_o(17 downto 0);

    -- d_u0_m0_wo0_sym_add23_q_12(DELAY,477)@11 + 1
    d_u0_m0_wo0_sym_add23_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add23_q, xout => d_u0_m0_wo0_sym_add23_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_2_shift2(BITSHIFT,328)@12
    u0_m0_wo0_mtree_mult1_2_shift2_qint <= d_u0_m0_wo0_sym_add23_q_12_q & "0000000000";
    u0_m0_wo0_mtree_mult1_2_shift2_q <= u0_m0_wo0_mtree_mult1_2_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_sub_3(SUB,329)@12 + 1
    u0_m0_wo0_mtree_mult1_2_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_2_shift2_q(22)) & u0_m0_wo0_mtree_mult1_2_shift2_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 18 => u0_m0_wo0_mtree_mult1_2_add_1_q(17)) & u0_m0_wo0_mtree_mult1_2_add_1_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_sub_3_q <= u0_m0_wo0_mtree_mult1_2_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift4(BITSHIFT,330)@13
    u0_m0_wo0_mtree_mult1_2_shift4_qint <= u0_m0_wo0_mtree_mult1_2_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_2_shift4_q <= u0_m0_wo0_mtree_mult1_2_shift4_qint(24 downto 0);

    -- u0_m0_wo0_mtree_add0_1(ADD,153)@13 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_2_shift4_q(24)) & u0_m0_wo0_mtree_mult1_2_shift4_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_3_shift6_q);
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,331)@11
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_sym_add24_q & "00";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(14 downto 0);

    -- u0_m0_wo0_sym_add24(ADD,124)@10 + 1
    u0_m0_wo0_sym_add24_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr24_q(11)) & u0_m0_wo0_wi0_r0_delayr24_q));
    u0_m0_wo0_sym_add24_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr27_q(11)) & u0_m0_wo0_wi0_r0_delayr27_q));
    u0_m0_wo0_sym_add24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add24_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add24_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add24_a) + SIGNED(u0_m0_wo0_sym_add24_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add24_q <= u0_m0_wo0_sym_add24_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_add_1(ADD,332)@11 + 1
    u0_m0_wo0_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_sym_add24_q(12)) & u0_m0_wo0_sym_add24_q));
    u0_m0_wo0_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_1_shift0_q(14)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_1_q <= u0_m0_wo0_mtree_mult1_1_add_1_o(15 downto 0);

    -- d_u0_m0_wo0_sym_add24_q_12(DELAY,478)@11 + 1
    d_u0_m0_wo0_sym_add24_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add24_q, xout => d_u0_m0_wo0_sym_add24_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,333)@12
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= d_u0_m0_wo0_sym_add24_q_12_q & "0000000000";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_3(SUB,334)@12 + 1
    u0_m0_wo0_mtree_mult1_1_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_1_shift2_q(22)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 16 => u0_m0_wo0_mtree_mult1_1_add_1_q(15)) & u0_m0_wo0_mtree_mult1_1_add_1_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_3_q <= u0_m0_wo0_mtree_mult1_1_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift4(BITSHIFT,335)@13
    u0_m0_wo0_mtree_mult1_1_shift4_qint <= u0_m0_wo0_mtree_mult1_1_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_1_shift4_q <= u0_m0_wo0_mtree_mult1_1_shift4_qint(24 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr25_q_12(DELAY,467)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr25_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => d_u0_m0_wo0_wi0_r0_delayr25_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,336)@12
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr25_q_12_q & "00000000000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_sub_1(SUB,337)@12 + 1
    u0_m0_wo0_mtree_mult1_0_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_0_shift0_q(22)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 12 => d_u0_m0_wo0_wi0_r0_delayr25_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr25_q_12_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_sub_1_q <= u0_m0_wo0_mtree_mult1_0_sub_1_o(23 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,152)@13 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo0_mtree_mult1_0_sub_1_q(23)) & u0_m0_wo0_mtree_mult1_0_sub_1_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_1_shift4_q(24)) & u0_m0_wo0_mtree_mult1_1_shift4_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,165)@14 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_0_q(25)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_1_q(25)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(26 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,171)@15 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add1_0_q(26)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add1_1_q(26)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(27 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,174)@16 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add2_0_q(27)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add2_1_q(27)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(28 downto 0);

    -- u0_m0_wo0_mtree_add4_0(ADD,176)@17 + 1
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add3_0_q(28)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_add3_1_q(27)) & u0_m0_wo0_mtree_add3_1_q));
    u0_m0_wo0_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(29 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_17(DELAY,462)@13 + 4
    d_u0_m0_wo0_compute_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,177)@17 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_17_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,182)@18 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add4_0_q;

END normal;
