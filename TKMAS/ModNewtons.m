function x=Newtons(f,x0,tol)
x=x0;
h=1e-8
it=[];
while abs(f(x)) > tol
    dfdx=(f(x+h)-f(x-h))/(2*h);
    x=x-f(x)./dfdx;
    it=[it x];
end
it