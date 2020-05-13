clear all
close all
clc

%% Variables
p=10e6; Di=70e-3; Dy=76e-3; d=30e-3; l=250e-3; h=35e-3; b=8e-3;
Es=210e9; Eal=70e9; Fn_ut=p*pi*Di.^2;

Acyl=pi/4*(Dy.^2-Di.^2);

%% Screw Test: M10
d=10e-3;
As=pi*(d/2).^2;
Ar=pi/4*((Di+2*d).^2-Di.^2)-4*pi*(d/2).^2;

%% Stiffness Components
Cscrew=Es*As/(l+2*b+h);
Ccyl=Es*Acyl/l;
Cr=Eal*Ar/h;

%% Stiffness Structure
Cs_ut=4*Cscrew;
Ck_ut=(1/Ccyl+1/Cr).^(-1);
Cs_in=Cr;
Ck_in=(1/Ccyl+4/Cscrew).^(-1);
C=[Cs_ut Ck_ut; Cs_in Ck_ut];

%% Calculation Elongation
F0_ut=Ck_ut/(Cs_ut+Ck_ut)*Fn_ut; %F?rsp?nning f?r att f?rhindra glapp
delta=Fn_ut/(Ck_ut+Cs_ut);
x=5e-4;
Cs_utpy=[0 Cs_ut*x];
Cs_utpx=[0 x];
Ck_utpy=[0 Ck_ut*delta];
Ck_utpx=[delta 0];
%% Plot
figure;
plot(Cs_utpx,Cs_utpy);
hold on
plot(Ck_utpx,Ck_utpy);
