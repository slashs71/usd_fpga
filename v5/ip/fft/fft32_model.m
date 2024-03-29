%    function [y] = fft_model(x,nps,inverse)             
%                                                                                             
%   Calculates the complex fixed-point FFT/IFFT for variable transform
%   sizes (stored in vector nps) of the complex input vector x.
%
%   Uses the fixed point model of the Variable Streaming architecture.
%                                                                                             
%   Inputs:   x          : Input complex vector. x will be split into blocks
%                          of various sizes as specified by nps. The size of this
%                          vector must greater than or equal to the sum of the
%                          values in nps.
%                          appended to the input sequence appropriately.                      
%             nps        : A vector of transform Lengths to be applied on a block-by-block basis.                
%             inverse    : A vector specifying the FFT direction on a block-by-block basis.   
%                          0 => FFT                                                           
%                          1 => IFFT
%                                                                                             
%   Outputs   y          : The transform-domain complex vector output                         
%                                                     
%                                                                                             
%   2001-2009 Altera Corporation, All Rights Reserved
%                                                                                                  
%   Automatically Generated: FFT MegaCore Function 9.0 Build 132 February, 2009                                                                                                   
%
%   This file is automatically generated. DO NOT EDIT.
%                                                                                       
function [y] = fft32_model(x,nps,inverse)         
addpath('d:/altera/90/ip/altera/fft/lib//ip_toolbench//../');
% Parameterization Space. 
N=32;
DATA_PREC=16;
TWIDDLE_PREC=16;
% Input is in natural order                                                           
INPUT_ORDER=1;  
% Output is in natural order                                                           
OUTPUT_ORDER=1;
% Fixed point data representation
REPRESENTATION=0;
% Data width at the input to each stage                                                                                     
PRUNE=[0,0,0];
y=[];           
i=1;
%for each block in the vector N, perform the transform
for i=1:length(nps)                                                                      
    rin = real(x(1:nps(i)));                                                          
    iin = imag(x(1:nps(i)));                                                                       
    [roc,ioc] = SVSfftmodel(rin,iin,DATA_PREC,TWIDDLE_PREC,N,nps(i),inverse(i), INPUT_ORDER, OUTPUT_ORDER,REPRESENTATION,PRUNE);      
    y = [y, roc+j*ioc]   ;
    %remove block from input vector
    x=x(nps(i)+1:end);  
end                                                                                           

