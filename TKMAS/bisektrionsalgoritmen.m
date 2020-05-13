%function [m,n] = bisektrionsalgoritmen(f,a,b,tol)

f=@(x)x-2*sin(x);
a=-5;
b=5;
n=0;
fa=f(a);
fb=f(b);
tol=1e-30;

while abs(a-b) > tol
    m=(a+b)/2;
    fm=f(m);
    if fa*fm <=0
        b=m;
        fb=fm;
    elseif fb*fm <=0
        a=m;
        fa=fm;
    else 
        break
    end
    dx=abs(b-a);
    n=n+1;
end
m
n


    