x=1;
tol=1e-10;
dx=2.*tol;
a=-0.1;

while abs(dx)>tol
    dx=-a*(2-x.^2);
    x=x+dx;
end
