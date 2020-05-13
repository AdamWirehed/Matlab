%% a)
f=@(x) x.^11-55*x.^9+1023*x.^7-7645*x.^5+21076*x.^3-14400*x;

%% b)
fplot(f,[-5 5]);
xlabel('x');
ylabel('f(x)');

%% c&e)
i=1;
hold on
for n=-5:2:5
    x{i}=fzero(f,n);
    plot(x{i},f(x{i}),'bO','markerfacecolor','b','markersize',7);
    i=i+1;
end

%% d)
Int=integral(f,-5,5)


