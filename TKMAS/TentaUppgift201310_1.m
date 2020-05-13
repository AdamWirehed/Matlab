%% a)
f=@(x) tanh(x)+cos(4.*x);

%% b)
fplot(f,[-0.7 0.7]);

%% c)
x1=fzero(f,-0.5)
x2=fzero(f,0.5)

%% d)
A=quad(f,x1,x2)

%% e)
hold on
plot(x1,f(x1),'sk','markersize',10,'markerfacecolor','k');
plot(x2,f(x2),'sk','markersize',10,'markerfacecolor','k');
