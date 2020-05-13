f=@(x) 5*x.^5+3*x.^2+5;
syms x
d=diff(f,x);
clear x
dx=matlabFunction(d);
Derivata2=@(x)dx(2).*x;
fplot(f,[0 5]);
hold on
fplot(Derivata2,[0 5]);