function derivata(f)
syms x
dx=diff(f,x);
clear x
df=matlabFunction(dx);
