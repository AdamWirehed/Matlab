function df=dmyfunction(x)
%DMYFUNCTION:Derivative of myfunction.
%
%   df(x)=sin(x) + x*cos(x) - 2*x*tan(x - pi/2) - x^2*(tan(x - pi/2)^2 + 1)
%
df=sin(x) + x.*cos(x) - 2.*x.*tan(x - pi/2) - x.^2.*(tan(x - pi/2).^2 + 1);