%% a)
Ma=1000; L=6; I0=5e-5; E=210e9;
w=@(x) (Ma*L.^2)/(6*E*I0)*((x/L).^3-3*(x/L).^2+(5/2)*(x/L));

%% b)
fplot(w,[0 L]);
xlabel('x');
ylabel('w(x)');

%% c)
dw=@(x)(Ma*L)/(6*E*I0)*(3*(x/L).^2-6*(x/L)+(5/2));
dx1=fzero(dw,5);
fprintf('Den största utböjningen har värdet %5.4f i punkten %5.4f \n',w(dx1),dx1);

%% d)
hold on
plot(dx1,w(dx1),'dk','linewidth',1,'markerfacecolor','m','markersize',7);


