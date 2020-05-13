%% a)
f=@(x) (x.^7-3*x.^6-2*x.^5+12*x.^4-8*x.^3); %Polyval kan användas istället dvs. pf=[1 -3 -2 12 8 0 0 0] f@(x)polyval(pf,x) 
g=@(x) (x.^6+x.^5-(29/2)*x.^4-25*x.^3+(129/16)*x.^2+(279/16)*x-(27/4));

figure;
fplot(f,[0 1],'k'); hold on; fplot(g,[0 1],'k--');
xlabel('x');
legend('f(x)','g(x)','location','southwest');

%% b)
h=@(x)(g(x)-f(x));
x1=fzero(h,0.4);
x2=fzero(h,0.6);

%% c)
figure;
[x,y]=fplot(h,[x1 x2],'k'); %Bra trick, ta ut x&y från fplot
area(x,y,'facecolor','r');  %Använd ev. "generate code"
xlabel('x'); ylabel('h(x)');

%% d)
A=integral(h,x1,x2);
txt=sprintf('A=%4.3f',A);
text((x1+x2)/2,0,txt,'HorizontalAlignment','center','VerticalAlignment','bottom');