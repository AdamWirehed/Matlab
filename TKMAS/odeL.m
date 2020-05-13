function dLdt=odeL(t,x)
%% Variabels
ms=1.99e30; %mass sun
mj=5.976e24; tj=365.25*24; rj=1; rjd=6371e3; %mass, pt, radius earth
mm=7.35e22; tm=27.32*24; rm=1738e3/rjd; %mass, pt, radius moon
dsj=149.6e9/rjd; %distance sun-earth
djm=0.3844e9/rjd; %distance earth-moon

G=6.673e-11/(rjd).^3*3600.^2; %Gravitation variable
a=0.001; %friction variable

%Coordinates
jx=dsj*cos(2*pi/tj*t); %position earth x-axis
jy=dsj*sin(2*pi/tj*t); %posistion earth y-axis
mx=jx-djm*sin(2*pi/tm*t); %position moon x-axis
my=jy+djm*cos(2*pi/tm*t); %postion moon y-axis

%Velocitys
jxdt=-dsj*(2*pi/tj)*sin(2*pi/tj*t); %velocity earth x-axis
jydt=dsj*(2*pi/tj)*cos(2*pi/tj*t); %velocity earth y-axis

%Forces
%Gravitational forces/forces
Gsl=G*ms/(x(1).^2+x(3).^2); %gravitational force sun -> shuttle
Gjl=G*mj/((jx-x(1)).^2+(jy-x(3)).^2); %gravitational force earth -> shuttle
Gml=G*mm/((mx-x(1)).^2+(my-x(3)).^2); %gravitational force moon -> shuttle

%x
Gsl_x=Gsl*(-x(1))/sqrt((x(1).^2+x(3).^2));
Gml_x=Gml*(mx-x(1))/sqrt(((mx-x(1)).^2+(my-x(3)).^2));
Gjl_x=Gjl*(jx-x(1))/sqrt(((jx-x(1)).^2+(jy-x(3)).^2));
F_x=-a*(x(2)-jxdt)*(norm([x(2) x(4)])-norm([jxdt jydt]))*abs(Gjl);

%y
Gsl_y=Gsl*(-x(3))/sqrt((x(1).^2+x(3).^2));
Gml_y=Gml*(my-x(3))/sqrt(((mx-x(1)).^2+(my-x(3)).^2));
Gjl_y=Gjl*(jy-x(3))/sqrt(((jx-x(1)).^2+(jy-x(3)).^2));
F_y=-a*(x(4)-jydt)*(norm([x(2) x(4)])-norm([jxdt jydt]))*abs(Gjl);

Lxp=x(2); 
Lxpp=Gsl_x+Gml_x+Gjl_x+F_x;
Lyp=x(4);
Lypp=Gsl_y+Gml_y+Gjl_y+F_y;

dLdt=[Lxp;Lxpp;Lyp;Lypp];
