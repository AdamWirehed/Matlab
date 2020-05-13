%% a)
%se trigfunktion.m

%% b)
f=@trigfunktion;
fplot(f,[0 1]);
xlabel('x');
ylabel('trigfunktion(x)');
title('Plot av funktionsfilen: trigfunktion(x)');
%% c)
x2=fzero(f,1);

%% d)
hold on
plot(x2,f(x2),'pk','markersize',7,'markerfacecolor','k');
