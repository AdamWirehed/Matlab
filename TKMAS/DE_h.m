function y=DE_h(h)
dvx=@(x) cos(cos(x).*-sin(x));
f=@(x) sin(cos(x));
x=5;
y=abs(dvx(x)-D_h(f,x,h));