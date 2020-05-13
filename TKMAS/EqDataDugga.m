function [a, d, c, f] = EqDataDugga(x, tag, h)
E=1e7;     % N/m^2 Young’s modulus
A=pi*(0.01*(1+h*x*(1-x)))^2;  % m^2   area
a=E*A;
d=0; c=0; f=0;