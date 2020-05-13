clear all
close all
clc

%% Vectors and Matrix
vc=[275 325 375];
f=[0.27 0.32 0.37];
Fc_vc=[932 921 919]; Fc_f=[919 1033 1219];
Ravc=[1.33 1.49 1.26]; Raf=[1.26 1.46 1.75]; Ra_re=[4.15 1.75]; re=[0.8 1.6];

kc=[2301 2274 2269 2152 2196]; hd=[0.269 0.269 0.269 0.319 0.369];  

figure;
vcp=subplot(2,1,1);
plot(vcp,vc,Fc_vc);
title('Fc(vc). Matning konstant f=0.27');
xlabel('vc [m/min]'); ylabel('Fc [N]');

fp=subplot(2,1,2);
plot(fp,f,Fc_f);
title('Fc(f). Hastighet konstant vc=375');
xlabel('f [mm/varv]');

figure;
vcR=subplot(3,1,1);
plot(vcR,vc,Ravc);
title('Ra(vc). Matning konstant f=0.27');
xlabel('vc [m/min]'); ylabel('Ra [mikro m]');

fR=subplot(3,1,2);
plot(fR,f,Raf);
title('Ra(f).Hastighet konstant vc=375');
xlabel('f [mm/varv]'); 

rep=subplot(3,1,3);
plot(rep,re,Ra_re);
title('Ra(r epsilon). Hastighet och matning konstant: vc=375, f=0.37');
xlabel('r_e [mm]');

figure;
plot(hd,kc);
title('kc(hd). Nominella spantjockleken beroende pa specifika skarkraften');
ylabel('kc [N]'); xlabel('hd [mm]');
