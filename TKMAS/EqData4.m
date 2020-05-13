function [a, d, c, f] = EqData3(x, tag)
% Returns the values at x of the data a=a(x), d=d(x), c=c(x) and f=f(x) 
% in the differential equation D(-aDu)+dDu+cu=f.
% tag is a subdomain reference tag, which is not used in this example.
% 
 if x<1/2
    a=7;
    f=3*9.81;
 else
     a=22;
     f=8*9.81;
 end
 d=0; 
 c=0; 
