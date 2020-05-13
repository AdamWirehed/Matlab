clear all
clc

A=[2 -3;1 2];
b=[-5;8];

x=A\b;
fprintf('x=%d och y=%d \n',x(1),x(2));

f=@(x)(2*x+5)/3;
g=@(x)(8-x)/2;

fplot(f,[0 4]); hold on; fplot(g,[0 4]);
h=@(x)(g(x)-f(x));
xs=fzero(h,5);
plot(xs,f(xs),'pr','markersize',7,'Markerfacecolor','r','Markeredgecolor','k');

%% Anders lösning
% xPlot=[0 4];
% y1Plot=(1/3).*(2*xPlot+5);
% y2Plot=-(1/2).*(xPlot-8);
% plot(xPlot,y1Plot,'k',xPlot,y2Plot,'k');
% xlabel('x'); ylabel('y');
% hold on
% plot(x(1),x(2),'pk','Markersize',7,'Markerfacecolor','r','Markeredgecolor','k');
