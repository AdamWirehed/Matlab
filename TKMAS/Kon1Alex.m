clear all
close all
clc

%% Variabels
Fvx=1600; Fvy=2250; Fvz=500; %forces
rk=0.08; a=0.05; b=0.14; c=0.07; d=0.1; L=a+b+c+d; %distances
delta=45; D=45; B=25; an=20; %angels
Lx=0.05; Ly=0; %distances

%Effekt=2pi*n*M
n=70/60; Px=3200;
Mv=Px/(2*pi*n);

%Cone-length
R=rk/sind(delta);

Fp=Mv/(rk); Fa=Fp*tand(B); Fr=Fp*tand(an)/cosd(B);

%% Equation-system
%Rax Ray Rbx Rby Rbz 
A= [1 0 1 0 0;
    0 1 0 1 0;
    0 0 0 0 1;
    0 0 -1*(a+b) 0 0;
    0 0 0 1*(a+b) 0];

q=[-Fvx-Fp;
    Fvy-Fa/sqrt(2)+Fr/sqrt(2);
    -Fvz-Fa/sqrt(2)-Fr/sqrt(2);
    Fvx*(a+b+c+d)+Fp*a-Fvz*Lx;
    Fvy*(a+b+c+d)-Fvz*Ly+Fr*cosd(delta)*a-Fr*sind(delta)*rk-Fa*cosd(delta)*rk-Fa*sind(delta)*a];

R=A\q;
Rax=R(1,1); Ray=R(2,1);
Rbx=R(3,1); Rby=R(4,1); Rbz=R(5,1);

%% Calculations

z=linspace(0,(a+b+c),1000);
for i=1:length(z)
    if z(i)>=0 && z(i)<(c)
        Tx(i) = Fvx;
        Ty(i) = -Fvy;
        Mx(i) = Fvz*Lx-Fvx*(z(i)+d);
        My(i) = Fvy*(z(i)+d);
        Mtot(i)=sqrt(Mx(i).^2+My(i).^2);
        Ttot(i)=sqrt(Tx(i).^2+Ty(i).^2);
    elseif z(i)>=(c) && z(i)<(c+b)
        Tx(i) = Fvx+Rbx;
        Ty(i) = Rby-Fvy;
        Mx(i) = Fvz*Lx-Fvx*(z(i)+d)-Rbx*(z(i)-c);
        My(i) = Fvy*(z(i)+d)-Rby*(z(i)-c);
        Mtot(i)=sqrt(Mx(i).^2+My(i).^2);
        Ttot(i)=sqrt(Tx(i).^2+Ty(i).^2);
    elseif z(i)>=(c+b) && z(i)<=(a+b+c)
        Tx(i) = Fvx + Rbx + Fp;
        Ty(i) = Rby-Fvy-Fr*cosd(delta)+Fa*sind(delta);
        Mx(i) = Fvz*Lx-Fvx*(z(i)+d)-Rbx*(z(i)-c)-Fp*(z(i)-(c+b));
        My(i) = Fvy*(z(i)+d)-Rby*(z(i)-c)+Fr*cosd(delta)*(z(i)-(c+b))-Fr*sind(delta)*rk-Fa*cosd(delta)*rk-Fa*sind(delta)*(z(i)-(c+b));
        Mtot(i)=sqrt(Mx(i).^2+My(i).^2);
        Ttot(i)=sqrt(Tx(i).^2+Ty(i).^2);
    end
end
%}
%% Plot
plot(z,Mtot);
title('Total torque');
ylabel('[Nm]'); xlabel('[m]');
figure;
plot(z,Ttot);
title('Total shear force');
ylabel('[N]'); xlabel('[m]');

figure;
Mxp=subplot(2,2,1);
plot(Mxp,z,Mx);
title(Mxp,'Mx');
ylabel(Mxp,'[Nm]'); xlabel('[m]');
Myp=subplot(2,2,2);
plot(Myp,z,My);
title(Myp,'My');
ylabel(Myp,'[Nm]');
Txp=subplot(2,2,3);
plot(Txp,z,Tx);
title(Txp,'Tx');
ylabel(Txp,'[N]'); xlabel('[m]');
Typ=subplot(2,2,4);
plot(Typ,z,Ty);
title(Typ,'Ty');
ylabel(Typ,'[N]');

%% Dimension Stress
sigma_B=640e6; %Beteckning 141650-01 (KTH s.386)
sigma_y=390e6;
E=206e9;
rho=7780;
kt=2;
diay_s=0.033;
diai_s=0.032;

for i=1:length(z)
        Mb=Mtot(i);
        m=rho*L*pi*((diay_s/2).^2-(diai_s/2).^2);
        Wv=pi*(diay_s.^3-diai_s.^4)/(16*diay_s);
        Wb=pi*(diay_s.^4-diai_s.^4)/(32*diay_s);
        tao=Mv/Wv*kt;
        sigma_n=Mb/Wb*kt; %Ska man g?nga med Kt
        %sigma_Vm=sqrt(tao.^2-tao*sigma_n+sigma_n.^2);
        sigma_Vm=sqrt(sigma_n.^2+3*tao.^2);
        
        while sigma_y < sigma_Vm
           diay_s=diay_s+0.0001;
           m=rho*L*pi*((diay_s/2).^2-(diai_s/2).^2);
           Wv=pi*(diay_s.^3-diai_s.^4)/(16*diay_s);
           Wb=pi*(diay_s.^4-diai_s.^4)/(32*diay_s);
           tao=Mv/Wv;
           sigma_n=Mb/Wb;
           sigma_Vm=sqrt(tao.^2-tao*sigma_n+sigma_n.^2);
        end
end


%% Dimension Fatigue
sigma_ub=270e6;


%% Dimension Bendning
d_max=50e-6;
diay_b=0.033; diai_b=0.032;
I=pi*(diay_b.^2-diai_b.^2)/64;
M1x=Fvx*(c+d)-Fvz*Lx; M2x=0; M_ubx=0; Px=-Fp;
M1y=-Fvy*(c+d); M2y=0; M_uby=-rk*(Fr*sind(D)+Fa*cosd(D)); Py=Fr*cosd(D)-Fa*sind(D);
delta=1;

while delta > d_max
    diay_b=diay_b+0.0001;
    I=pi*(diay_b.^4-diai_b.^4)/64;

    m1x=M1x*L/(3*E*I)+M2x*L/(6*E*I)+M_ubx*L/(6*E*I)*(1-3*(a/L).^2)+Px*L.^2/(6*E*I)*(b+c+d)/L*a/L*(1+a/L);
    m1y=M1y*L/(3*E*I)+M2y*L/(6*E*I)+M_uby*L/(6*E*I)*(1-3*(a/L).^2)+Py*L.^2/(6*E*I)*(b+c+d)/L*a/L*(1+a/L);
    delta_x=d*sind(m1x); delta_y=d*sind(m1y);
    delta=norm([delta_x delta_y]);
end

