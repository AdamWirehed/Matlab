clear all
close all
clc

%% Variabels
m14=17e-3; m45=10e-3; zpg1=20; zpg2=150; zpg3=65; n_in=14; n_ut=1500; a14=853e-3; a45=521e-3;
alpha0=20; w_ut=n_ut*2*pi/60; w_in=n_in*2*pi/60;

%% Total utv?xling
itot=n_ut/n_in;

%% Planetv?xel
R=-zpg2/zpg1;
n1=-R*n_in+n_in;
i_pv=n1/n_in;   %utv?xling planetv?xel

%% Kuggtal och utv?xling
i_14=sqrt(n_ut/n1); i_45=i_14;
A1=[1 1; 1 -i_14]; %Z11+Z41=2a14/m14; Z11-i14*Z41=0
b1=[2*a14/m14;0];
A2=[1 1; 1 -i_45]; %Z42+Z51=2a45/m45; Z42-i45*Z51=0
b2=[2*a45/m45;0];

Z1=A1\b1; Z2=A2\b2;
Z=[Z1 Z2];
z11=round(Z(1,1)); z41=round(Z(2,1)); z42=round(Z(1,2)); z51=round(Z(2,2));
z=[z11 z42; z41 z51];

%% Profilf?rskjutning
a1=m14*(z11+z41)/2;
aw_14=a14;
a2=m45*(z42+z51)/2;
aw_45=a45;
alpha_w14=acos(a1*cosd(alpha0)/aw_14);
alpha_w45=acos(a2*cosd(alpha0)/aw_45);

a_ref1=m14*(z41+z11)/2; a_ref2=m45*(z42+z51)/2;
aw_ref1=a_ref1*cosd(alpha0)/cos(alpha_w14); aw_ref2=a_ref2*cosd(alpha0)/cos(alpha_w45);
x14=(involute(alpha_w14)-involute(alpha0*pi/180))*(z11+z41)/(2*tand(alpha0)); 
x45=(involute(alpha_w45)-involute(alpha0*pi/180))*(z42+z51)/(2*tand(alpha0));

%% Ingreppstal
c14=0.25*m14; c45=0.25*m45;

rb1_14=m14*z11/2*cosd(alpha0);
rb2_14=m14*z41/2*cosd(alpha0);
rb1_45=m45*z42/2*cosd(alpha0);
rb2_45=m45*z51/2*cosd(alpha0);

rf1_14=(z11/2+x14/2-1.25)*m14;
rf2_14=(z41/2+x14/2-1.25)*m14;
rf1_45=(z42/2+x45/2-1.25)*m45;
rf2_45=(z51/2+x45/2-1.25)*m45;

ra1_14=aw_14-rf2_14-c14;
ra2_14=aw_14-rf1_14-c14;
ra1_45=aw_45-rf2_45-c45;
ra2_45=aw_45-rf1_45-c45;

Pb_14=pi*m14*cosd(alpha0);
Pb_45=pi*m45*cosd(alpha0);

g_14=sqrt((ra1_14).^2-(rb1_14).^2)+sqrt((ra2_14).^2-(rb2_14).^2)-(rb1_14+rb2_14)*tan(alpha_w14);
g_45=sqrt((ra1_45).^2-(rb1_45).^2)+sqrt((ra2_45).^2-(rb2_45).^2)-(rb1_45+rb2_45)*tan(alpha_w45);

eps14=g_14/Pb_14;
eps45=g_45/Pb_45;

%% Interferens
e14=m14; e45=m45;
N1C1_14=m14*z11/2*sind(alpha0)-(e14-(x14/2)*m14)/sind(alpha0);
N2C2_14=m14*z41/2*sind(alpha0)-(e14-(x14/2)*m14)/sind(alpha0);

N1C1_45=m45*z42/2*sind(alpha0)-(e45-(x45/2)*m45)/sind(alpha0);
N2C2_45=m45*z51/2*sind(alpha0)-(e45-(x45/2)*m45)/sind(alpha0);

N1A2_14=(rb1_14+rb2_14)*tan(alpha_w14)-sqrt((ra2_14).^2-(rb2_14).^2);
N2A1_14=(rb1_14+rb2_14)*tan(alpha_w14)-sqrt((ra1_14).^2-(rb1_14).^2);

N1A2_45=(rb1_45+rb2_45)*tan(alpha_w45)-sqrt((ra2_45).^2-(rb2_45).^2);
N2A1_45=(rb1_45+rb2_45)*tan(alpha_w45)-sqrt((ra1_45).^2-(rb1_45).^2);

if N1C1_14 <= N1A2_14 && N2C2_14 <= N2A1_14
    fprintf('Interferens undviks i v1 (14)! \n');
else
    fprintf('Interferens undviks inte i v1 (14)! G?r om g?r r?tt! \n');
end
fprintf('N1C1_14 - N1A2_14 = %0.4f \nN2C2_14 - N2A1_14 = %0.4f \n \n',N1C1_14 - N1A2_14,N2C2_14 - N2A1_14);

if N1C1_45 <= N1A2_45 && N2C2_45 <= N2A1_45
    fprintf('Interferens undviks i v2 (45)! \n');
else
    fprintf('Interferens undviks inte i v2 (45)! G?r om g?r r?tt! \n');
end
fprintf('N1C1_45 - N1A2_45 = %0.4f \nN2C2_45 - N2A1_45 = %0.4f \n \n',N1C1_45 - N1A2_45,N2C2_45 - N2A1_45);

%% Undersk?rning
U_14=2*(e14/m14-x14/2)/(sind(alpha0)).^2;
U_45=2*(e45/m45-x45/2)/(sind(alpha0)).^2;

if z41 >= U_14 && z51 >= U_45
    fprintf('Underskarning undviks!\n');
else
    fprintf('Underskarning undviks inte!n');
end

%% Topph?jdsminskning
dha_14=m14*((z11+z41)/2+x14)-aw_14;
dha_45=m45*((z42+z51)/2+x45)-aw_45;

%% Sp?nning
sigma_max=350e6;
P_max=2.5e6;
n2=n1*z11/z41; Kl=1.5; Kv=1; Kfb=2; Kfa=1; Yb=1;
Yf1_14=2.18; Yf2_14=2.56; Yf1_45=2.2; Yf2_45=2.58;
Ye_14=1/eps14; Ye_45=1/eps45;

delD14_1=m14*z11;
delD14_2=m14*z41;
delD45_1=m45*z42;
delD45_2=m45*z51;

T1=P_max*60/(2*pi*n1);
T2=P_max*60/(2*pi*n2);
T3=P_max*60/(2*pi*n_ut);

Fber1_14=2*T1/delD14_1*Kl*Kv;
Fber2_14=2*T2/delD14_2*Kl*Kv;
Fber1_45=2*T2/delD45_1*Kl*Kv;
Fber2_45=2*T3/delD45_2*Kl*Kv;

b11=Yf1_14*Yb*Ye_14*Fber1_14*Kfa*Kfb/(sigma_max*m14);
b41=Yf2_14*Yb*Ye_14*Fber2_14*Kfa*Kfb/(sigma_max*m14);
b42=Yf1_45*Yb*Ye_45*Fber1_45*Kfa*Kfb/(sigma_max*m45);
b51=Yf2_45*Yb*Ye_45*Fber2_45*Kfa*Kfb/(sigma_max*m45);

b_14=[b11 b41];
b_45=[b42 b51];
b1=max(b_14); b2=max(b_45);
b=[b1 b2];
%% Faktisk utg?ende hastighet
n_utf=z42*n2/z51;
