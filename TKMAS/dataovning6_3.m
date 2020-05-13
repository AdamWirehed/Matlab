clear all
clear workspace
clc

f_a=@(x) x.^2-2;
f_b=@(x) x.^4-2;
f_c=@(x) x-cos(x);
f_d=@(x) x.^3-(sin(x)).^2;
g_a=@(x) x-0.1.*f_a(x);
g_b=@(x) x-0.1.*f_b(x);
g_c=@(x) x-0.1.*f_c(x);
g_d=@(x) x-0.1.*f_d(x);

x0=1;
tol=1e-6;

x_a=fixpunkt(g_a,x0,tol);
x_a;
x_b=fixpunkt(g_b,x0,tol);
x_b;
x_c=fixpunkt(g_c,x0,tol);
x_c;
x_d=fixpunkt(g_d,x0,tol);
x_d; (Möjligen fel i facit)