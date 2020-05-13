function value=riemann(f,I,n,type)
% Riemann integration
% 
%   Syntax: 
%           value=riemann(f,I,n,type)
%   Arguments: 
%           f = function handle pointing to a function file  
%               which returns an scalar y=f(x).  
%           I = a 1x2 matrix [a,b] containing the integration limits (a<b)
%           n = the number of intervals
%           type = 1 for left-hand value on each interval, 2 for right-hand value, 3 for midpoint
%   Returns: 
%           value - the approximate value of the integral 
%

%----------------------------------------------------------------------
%   Date created: 
%
%   Author:  
%------------------------------+---------------------------------------+
value=0;
x=linspace(I(1),I(2),n+1);

if type==1
    for i=1:n
        StA=f(x(i))*(x(i+1)-x(i));
        value=value+StA;
    end
elseif type==2
    for i=1:n
    StA=f(1/2*x(i)+1/2*x(i+1))*(x(i+1)-x(i));
    value=value+StA;
    end
elseif type==3
    for i=1:n
        StA=f(x(i+1))*(x(i+1)-x(i));
        value=value+StA;
    end
end


