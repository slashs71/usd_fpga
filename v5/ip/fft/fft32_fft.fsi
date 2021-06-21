// ================================================================================
// Legal Notice: Copyright (C) 1991-2008 Altera Corporation
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
// ================================================================================
//
#define FFT_NAME fft32_fft
#define IN_DW 16
#define OUT_DW 23  
#define FFTPTS_SIZE (5 + 1)
#define TWIDW 16
#define ROUNDING_TYPE 1
#define OUTPUT_ORDER 1
#define INPUT_ORDER 1
#define REPRESENTATION 0
#define PRUNE {0,0,0}
namespace{
#include "util.cpp"
#include "expression.cpp"
#include "fpCompiler.cpp"
}
#include "fft.cpp"
  
  
  
