y0=25;
Kp=0.2;
Ti=5;
c=0.5/sqrt(10.*Kp);
w=sqrt(10.*Kp);
p=asin(1-c.^2);
umax=6;

y=@(t) y0.*(1-exp(-w.*c.*t)/sqrt(1-c.^2).*sin(w.*t+p));
u=@(t) (Kp.*y0+t.^2/(2.*Ti)).*exp(-w.*c.*t)/sqrt(1-c.^2).*sin(w.*t+p);
t=linspace(0,20);

figure;
if any(y(t)) > y0*1.1 || any(y(t)) < y0*0.9
    subplot(2,1,1);
    plot(t,y(t),'r','LineWidth',2);
    hold on
    plot(t,linspace(y0,y0)*1.1);
    plot(t,linspace(y0,y0)*0.9);
    xlabel('t');
    ylabel('Hastighet [km/h]');
else
    subplot(2,1,1);
    plot(t,y(t));
    hold on
    plot(t,linspace(y0,y0)*1.1);
    plot(t,linspace(y0,y0)*0.9);
    xlabel('t');
    ylabel('Hastighet [km/h]');
end

if any(u(t)) > umax
    subplot(2,1,2);
    plot(t,u(t),'r','LineWidth',2);
    hold on
    plot(t,linspace(umax,umax),'LineWidth',2);
    xlabel('t');
    ylabel('Trottelvinkel');
else
    subplot(2,1,2);
    plot(t,u(t));
    hold on
    plot(t,linspace(umax,umax),'LineWidth',2);
    xlabel('t');
    ylabel('Trottelvinkel');
end

