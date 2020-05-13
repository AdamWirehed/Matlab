%% a)

f=@(x) -x.^7+44*x.^6-653*x.^5+3734*x.^4-4400*x.^3-23680*x.^2+38912*x+53760;

%% b)
x{1}=fzero(f,-20);
x{2}=fzero(f,30);
fplot(f,[x{1} x{2}]);
xlabel('x');
ylabel('f(x)');

%% c)
i=3;
for n=0:3:15
    x{i}=fzero(f,n);
    i=i+1;
end
hold on
for n=1:length(x)
    plot(x{n},f(x{n}),'rp','markersize',7,'markeredgecolor','k','markerfacecolor','r');
end

%% d)
A=[4 3;
    3 -5];
b=[5;1];
x=A\b