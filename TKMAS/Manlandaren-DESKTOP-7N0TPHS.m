%% Manlandaren
%Distance in rj (radius earth)
%Time in h (hour)

clc
clear all

%% Variabels
G=6.673e-11; %Gravitationskonstanten
a=0.001; %friktions konstant
%t=linspace(0,365.25*24);

ms=1.99e30; %massa solen
mj=5.976e24; tj=365.25*24; rj=6371e3; %massa, periodtid, radie earth
mm=7.35e22; tm=27.32*24; rm=1738e3/rj; %massa, periodtid, radie moon
dsj=149.6e6/rj; %avst?nd solen-jorden
djm=0.3833e6/rj; %avst?nd jorden-moon

%% Functions

%Distances
jx=@(t) dsj*cos(2*pi/tj*t); %position jorden x-axel
jy=@(t) dsj*sin(2*pi/tj*t); %posistion jorden y-axel
mx=@(t) jx(t)-djm*sin(2*pi/tm*t); %position m?nen x-axel
my=@(t) jy(t)+djm*cos(2*pi/tm*t); %postion m?nen y-axel

%Velocitys
jxdt=@(t) -(2*pi*dsj/tj)*sin(2*pi/tj*t);
jydt=@(t) (2*dsj*pi/tj)*cos(2*pi/tj*t);

fplot(jx,jy,[0 365.25*24]);
hold on
fplot(mx,my,[0 365.25*24]);

%Differential equations
dLxdt=@(t,x,y) [x(2); -x(1).^2/(x(1).^2+y(1).^2).^(3/2)+(mx(t)-x(1)).^2/((mx(t)-x(1)).^2+(my(t)-y(1)).^2).^(3/2)+(jx(t)-x(1)).^2/((jx(t)-x(1)).^2+(jy(t)-y(1)).^2).^(3/2)-a*(x(2)-%derivata jx)*(norm(x(2),y(2))-norm(derivata av j))*abs(Gjl)];
ode45(dLxdt,[0 tj],dsj); %Funkar ej, ej f?rdig diff.ekv.
%%
% %Force components
% ksx=@(t) -lx(t)/sqrt(lx(t).^2+ly(t).^2); %komposant solen x-led
% ksy=@(t) -ly(t)/sqrt(lx(t).^2+ly(t).^2); %komposant solen y-led
% kjx=@(t) (jx(t)-lx(t))/sqrt((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %komposant jorden x-led
% ksy=@(t) (jy(t)-ly(t))/sqrt((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %komposant jorden y-led
% kmx=@(t) (mx(t)-lx(t))/sqrt((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %komposant m?nen x-led
% kmy=@(t) (my(t)-ly(t))/sqrt((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %komposant m?nen y-led
% 
% %Gravitational forces/forces
% Gsl=@(t) G*ms/(lx(t).^2+ly(t).^2); %solens gravitation p? m?nlandare
% Gjl=@(t) G*mj/((jx(t)-lx(t)).^2+(jy(t)-ly(t)).^2); %jordens gravitation p? m?nlandare
% Gml=@(t) G*mm/((mx(t)-lx(t)).^2+(my(t)-ly(t)).^2); %m?nens gravitation p? m?nlandare
% F=@(t) -a*v*abs(v)*abs(Gjl); %friktion m?nlandare
