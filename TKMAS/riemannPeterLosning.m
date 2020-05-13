function value=riemannPeterLosning(f,I,n,type)
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
for i=1:n
  if type==1
        incr=f(x(i))*(x(i+1)-x(i));
  elseif type==2
        incr=f(x(i+1))*(x(i+1)-x(i));
  elseif type==3
        incr=f(1/2*x(i)+1/2*x(i+1))*(x(i+1)-x(i));
end
value=value+incr;
end
% Alternative solution without for-loop.
%
%x=linspace(I(1),I(2),n+1);
%dx=(I(2)-I(1))/n;
%if type ==1 
%   c=x(1:n);
%elseif type ==2
%   c=x(2:n+1);
%elseif type==3
%   c=1/2*(x(1:n)+x(2:n+1));
%end
%value = sum(f(c))*dx 