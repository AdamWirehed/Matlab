% Lagrange-metod för extrempunkter
tol=1e-6;

f=@(x) x(1)*x(2)*sqrt(x(3));
g=@(x) x(1)+x(2)+x(3)-1;
L=@(x) f(x)+x(4)*g(x);
dl=@(x) jacobi(L,x)';
x0=[1 1 1 1];
sp=newton(dl,x0,tol);
y=f(sp);
