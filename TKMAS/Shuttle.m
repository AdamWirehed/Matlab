%% Shuttle
%Distance in rj (radius earth)
%Time in h (hour)

clc
clear all
close all

%% Variabels
ms=1.99e30; %mass sun
mj=5.976e24; tj=365.25*24; rj=1; rjd=6371e3; %mass, pt, radius earth
mm=7.35e22; tm=27.32*24; rm=1738e3/rjd; %mass, pt, radius moon
dsj=149.6e9/rjd; %disctance sun-earth
djm=0.3844e9/rjd; %distance earth-moon
g=9.82/rjd*(3600.^2);
rs=695700e3/rjd;

G=6.673e-11/(rjd).^3*3600.^2; %Gravitation variable
a=0.001; %friktion variable
tspan=0:0.1:371;
jvel=(2*pi/tj)*dsj; %starting velocity earth

%Start values
% stvl=23.170000000000002; 
% av=93.5299;                 %crash moon
stvl=22.777; av=96.4477;      %crash earth
svx=stvl*cosd(av);
svy=stvl*sind(av);

% stvl=23.170000000000002 av=93.5299 crash moon

% stvl=22.784;
% av=96.4477;
%% Differential equations
[t,x]=ode45(@odeL,tspan,[dsj svx rj svy]);

%Distances
jx=dsj*cos(2*pi/tj*t); %position earth x-axis
jy=dsj*sin(2*pi/tj*t); %posistion earth y-axis
mx=jx-djm*sin(2*pi/tm*t); %position moon x-axis
my=jy+djm*cos(2*pi/tm*t); %postion moon y-axis

%Velocities
jxp=-(2*pi/tj)*dsj*sin(2*pi/tj*t);
jyp=(2*pi/tj)*dsj*cos(2*pi/tj*t);

%Acceleration
jxpp = -jx*((2*pi/tj).^2);
jypp = -jy*((2*pi/tj).^2);
%% Seekers
%Impact moon and earth
dml=sqrt((mx-x(:,1)).^2+(my-x(:,3)).^2); %distance moon-shuttle
djl=sqrt((jx-x(:,1)).^2+(jy-x(:,3)).^2);
for i=1:length(t)
    if dml(i)<=rm
        fprintf('Bullseye! Moon impact! \n');
        fprintf('Time of impact:%2.0f h \n',i/10);
        fprintf('Coordinates:(%1.3e,%1.3e) [er] \n',x(i,1),x(i,3));
        tend=[1:1:i]';
        break
    elseif djl(i)<=rj && i~=1
        fprintf('Bullseye! Earth impact! \n');
        fprintf('Time of impact:%2.0f h \n',i/10);
        fprintf('Coordinates:(%1.3e,%1.3e) [er] \n',x(i,1),x(i,3));
        tend=[1:1:i]';
        break
    else
        continue
    end
end
%% Plot
%Tellus system
 lan=animatedline('Color','r','linewidth',1);
 man=animatedline('Color','k','linewidth',1);
 title('Earth system');
 axis([-80 80 -20 150]);
 hold on
 plot(0,0,'o','markersize',10,'markerfacecolor','g','markeredgecolor','g');
 legend('Shuttle','Moon','Earth');
 for i = 1:length(tend)
     addpoints(lan,x(i,1)-jx(i),x(i,3)-jy(i));
     addpoints(man,mx(i)-jx(i),my(i)-jy(i));
     drawnow limitrate
     pause(0.001);
 end

%Calculation velotcity/acceleration relative earth
lx=x(:,1); lxp=x(:,2); ly=x(:,3); lyp=x(:,4);
for i=1:length(tend)
    vacl = odeL(t(i),[lx(i);lxp(i);ly(i);lyp(i)]);
    ac(i) = abs((norm([vacl(2) vacl(4)])-norm([jxpp(i) jypp(i)]))/g);
    v(i) = abs(norm([lxp(i) lyp(i)])-norm([jxp(i) jyp(i)]));
end

%Plot Acceleration
figure;
semilogy(tend/10,ac)
title('Shuttle acceleration/earth')
xlabel('Time [h]')
ylabel('Acceleration [er/h^2]')


%Plot Velocity
figure;
plot(tend/10,v)
title('Shuttle velocity/earth')
xlabel('Time [h]')
ylabel('Velocity [er/h]') 