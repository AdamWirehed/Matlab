function [k, uA, g] = BdryDataDugga(x, tag, P)
%Högt tal på k eftersom det inte kan böjas där?
if tag==1  k=1e8; uA=0;   g=0; end
if tag==2  k=0;   uA=0;   g=P; end