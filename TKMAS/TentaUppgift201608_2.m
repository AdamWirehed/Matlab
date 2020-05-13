%%
O=linspace(0,2*pi);
a=2;
b=1;
x=a*cos(O);
y=b*sin(O);
plot(x,y,'k');
axis equal
%%
Om=@(a,b) pi*(3*(a+b)-sqrt((3*a+b)));
Om(2,1)
%%
