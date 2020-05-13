tol=1e-10;
dx=2*tol;
x=1;
a=-0.1;

while abs(dx) > tol
    dx=-(x.^5-100)/(5*x.^4);
    x=x+dx;
end