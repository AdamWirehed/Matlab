f=@(x) x.^6-8*x.^5-5*x.^4+40*x.^3+4*x.^2-32*x;
x=linspace(-2,2);
area(x,f(x),'LineWidth',2,'FaceColor','r');
xlabel('x');
ylabel('f(x)');
%%
Int=integral(f,-2,2);
IntS=sprintf('A= %0.1f',Int);
text(-.5,20,IntS);
%%
p=-2;
for n=1:5
    xsol{n}=fzero(f,p);
    p=p+1;
end
fprintf('Nollställena är: %d %d %d %d %d \n',xsol{1},xsol{2},xsol{3},xsol{4},xsol{5})
%%
syms x
Derf=diff(f,x);
clear x
DerivataF=matlabFunction(Derf);
Tangent=@(x)DerivataF(0.5).*x;
hold on
fplot(Tangent,[-1 1],'b','LineWidth',2);

