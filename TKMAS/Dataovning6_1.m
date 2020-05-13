f_a=@(x) x.^2-2;
f_b=@(x) x.^4-2;
f_c=@(x) x-cos(x);
f_d=@(x) 1+sin(x).^2-x.^3;

tol=1e-6;

format long
x_a1=Bisek(f_a,0,5,tol);
x_a2=Bisek(f_a,-5,0,tol);
[x_a1,x_a2];

x_b1=Bisek(f_b,0,5,tol);
x_b2=Bisek(f_b,-5,0,tol);
[x_b1,x_b2];

x_c=Bisek(f_c,-3,3,tol);
x_c;

x_d=Bisek(f_d,-5,5,tol);
x_d;