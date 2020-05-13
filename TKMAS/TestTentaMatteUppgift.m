tol=1e-10;
dx=2*tol;
x=1;

while abs(dx)>tol
    dx=-(100-x.^5)/(-5*x.^4);
    x=x+dx;
end