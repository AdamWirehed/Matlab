function [T,M]=snofall(D)
R1=rand(1); R2=rand(1); R3=rand(1);

if R1 >= 0.85
    T=0.065*sqrt(-2*log(1-R2));
else
    T=0;
end
M=9.81*(0.2*D*R3/90+0.1)*T;

