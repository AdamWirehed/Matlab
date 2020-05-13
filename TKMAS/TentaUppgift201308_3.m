%% a)
t=linspace(0,2*pi);
x=r.*(t-sin(t));
y=r.*(1-cos(t));
r=input('Vilket v�rde ska r (radien) ha? \n');
N=input('Hur m�nga cirklar ska ritas? \n');
plot(x,y,'g--');

%% b)
%se RitaCirkel.m

%% c)
tn=linspace(0,2*pi,N);
for n=1:N
    hold on
    RitaCirkel(tn(n)*r,r,r);
end
axis equal
