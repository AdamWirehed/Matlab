function [k, uA, g] = BdryDataDugga(x, tag, P)
%H�gt tal p� k eftersom det inte kan b�jas d�r?
if tag==1  k=1e8; uA=0;   g=0; end
if tag==2  k=0;   uA=0;   g=P; end