clear all
clc

x=1;
tol=1e-10;
dx=2*tol;

while abs(dx) > tol
    dx=-(2-x.^2)/(-2*x);
    x=x+dx;
    
end
x
 