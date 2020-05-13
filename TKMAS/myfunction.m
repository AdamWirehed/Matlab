function f=myfunction(x)
%MYFUNCTION: the function
%   
%       f(x)=x*sin(x) - x^2*tan(x - pi/2)
%
f = x.*sin(x) - x.^2.*tan(x - pi/2);
