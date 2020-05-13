%% Manlandaren Backup 27-09-2017
%Distance in rj (radius earth)
%Time in h (hour)

clc
clear all

%% Variabels
ms=1.99e30; %massa solen
mj=5.976e24; tj=365.25*24; rj=1; rjd=6371e3; %massa, periodtid, radie jorden
mm=7.35e22; tm=27.32*24; rm=1738e3/rjd; %massa, periodtid, radie moon
dsj=149.6e9/rjd; %avst?nd solen-jorden
djm=0.3844e9/rjd; %avst?nd jorden-moon

G=6.673e-11/(rjd).^3*3600.^2; %Gravitationskonstanten
a=0.001; %friktions konstant

%% Differential equations
[t,x]=ode45(@odeL,[0 tj],[dsj 0 rj 6.3]); %Funkar ej, ej f?rdig diff.ekv.

%% Notes

%% Functions

%Distances
jx=@(t) dsj*cos(2*pi/tj*t); %position jorden x-axel
jy=@(t) dsj*sin(2*pi/tj*t); %posistion jorden y-axel
mx=@(t) jx(t)-djm*sin(2*pi/tm*t); %position m?nen x-axel
my=@(t) jy(t)+djm*cos(2*pi/tm*t); %postion m?nen y-axel

%Velocitys
jxdt=@(t) -(2*pi*dsj/tj)*sin(2*pi/tj*t);
jydt=@(t) (2*dsj*pi/tj)*cos(2*pi/tj*t);

%% Equations
%Force components
ksx=@(t) -lx(t)/sqrt(lx(t).^2+ly(t).^2); %komposant solen x-led
ksy=@(t) -ly(t)/sqrt(lx(t).^2+ly(t).^2); %komposant solen y-led
kjx=@(t) (jx(t)-lx(t))/sqrt((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %komposant jorden x-led
ksy=@(t) (jy(t)-ly(t))/sqrt((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %komposant jorden y-led
kmx=@(t) (mx(t)-lx(t))/sqrt((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %komposant m?nen x-led
kmy=@(t) (my(t)-ly(t))/sqrt((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %komposant m?nen y-led

%Gravitational forces/forces
Gsl=@(t) G*ms/(lx(t).^2+ly(t).^2); %solens gravitation p? m?nlandare
Gjl=@(t) G*mj/((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %jordens gravitation p? m?nlandare
Gml=@(t) G*mm/((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %m?nens gravitation p? m?nlandare
F=@(t) -a*v*abs(v)*abs(Gjl); %friktion m?nlandare

%Differental equations
dLxdt=@(t,x,y) [x(2); -x(1).^2/(x(1).^2+y(1).^2).^(3/2)+(mx(t)-x(1)).^2/((mx(t)-x(1)).^2+(my(t)-y(1)).^2).^(3/2)+(jx(t)-x(1)).^2/((jx(t)-x(1)).^2+(jy(t)-y(1)).^2).^(3/2)-a*(x(2)-jxdt)*(norm([x(2) y(2)])-norm([jxdt jydt]))*abs(Gjl)];
dLydt=@(t,x,y) [y(2); -y(1).^2/(x(1).^2+y(1).^2).^(3/2)+(my(t)-y(1)).^2/((mx(t)-x(1)).^2+(my(t)-y(1)).^2).^(3/2)+(jy(t)-y(1)).^2/((jx(t)-x(1)).^2+(jy(t)-y(1)).^2).^(3/2)-a*(y(2)-jydt)*(norm([x(2) y(2)])-norm([jxdt jydt]))*abs(Gjl)];