%Skärningspunkt
clear all
clc
close all

f=@(x)(0.01.*x.^(3)-0.02.*x.^2-0.5);
g=@(x)(1-exp(1).^(-2.*x).*sin(4.*x));

fplot(f,[0,10],'k')
hold on
fplot(g,[0,10],'r--')
h=@(x)(f(x)-g(x)); %Där h==0 är f(x)=g(x)
xsol=fzero(h,5)
plot(xsol,f(xsol),'xb');
legend('f(x)','g(x)','f=g','Location','Best');
xlabel('x');
