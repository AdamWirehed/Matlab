close all

%% D1 Variabels
K=273.15;
p1=1.013e5; p2=18e5; p4=p1;
T1=10+K; T3=1180+K; 
cp=1e3; cv=0.721e3;
k=1.4;
VisK=0.89; VmekK=0.991; VBK=0.994; VisGT=0.86; VmekGT=0.991; VmekGENGT=0.993;
PGT=138e6; %[W_el]
Hi=47.8e6; %[J/kg]
%% T2
T2is=T1*(p2/p1).^((k-1)/k);
T2=T1-(T1-T2is)/VisK;

%% wtk (dU=0, dQ=0)
wtk=cp*(T2-T1);
waxk=wtk/VmekK;

%% qAM & qFB (dv=0 -> dqAM=du)
qAM=cp*(T3-T2);
qFB=qAM/VBK;
qAMis=cp*(T3-T2is);
%% T4
p3=p2;
T4is=T3/((p3/p4).^((k-1)/k));
T4=T3-(T3-T4is)*VisGT;

%% wtGT, waxGT, welGEN
wtGT=cp*(T3-T4);
waxGT=wtGT*VmekGT;
welGEN=(waxGT-waxk)*VmekGENGT;

%% qav
qav=cp*(T4-T1);
qavis=cp*(T4is-T1);
%% Vt, Vel
Vt=1-qavis/qAMis; %isentropiska temp. ty ideala f?rh?llande
Vel=welGEN/qFB;

%% mpluft, mpbr
mpluft=PGT/welGEN;
mpbr1=mpluft*qFB/Hi;

%% Volymitet
Rluft=287;
v1=Rluft*T1/p1;
v2=Rluft*T2/p2;
v3=Rluft*T3/p3;
v4=Rluft*T4/p4;
v=[v1 v2 v3 v4];

%% D2 (Ber?kningar utf?rda p? papper, se anteckningsblock f?r fullst?ndiga ber?kningar)
pb=120e5; Te=500; pe=100e5; pf=0.1e5; pa=pf; va=0.001;
Visat=0.905; Pacnet=140e6; Hi=47.8e6; Vpann=0.91; 
Vmekat=0.988; Vmekatgen=0.995; Vmekpump=0.9;
ha=191.83e3; sa=0.9493e3;
hb=203.82e3; sb=sa;
hc=1424.576e3; sc=3.3876e3;
hd=2717.1e3; sd=5.58954e3;
he=3373.7e3; se=6.5966e3;
hfis=2089.1e3; sfis=se; xfis=0.7929; 
hf=2211.14e3; sf=6.97e3; xf=0.844;

wtpump=hb-ha; welpump=(hb-ha)/Vmekpump;
qfv=hc-hb; qfa=hd-hc; qoh=he-hd; qkon=hf-ha;
qbr=(qfv+qfa+qoh)/Vpann; qavgas=qbr-(qfv+qfa+qoh);
wtat=he-hf; waxat=wtat*Vmekat; welgen=waxat*Vmekatgen;
Vel=(welgen-welpump)/qbr;
mpv=Pacnet/(welgen-welpump);
mpbr2=mpv*qbr/Hi;

%% D3
avf_g=0.22; pg=2.5e5; alpha=0.9;  pb=120e5;
T5=100; To=40; Tp=80; pf=0.25e5; pa=pf;

% hg, hf
xfis=0.822; hfis=2200.64e3; hf=2312.08e3;
hg=2645e3; sg=6.88e3; %diagram
h5=2676.1e3; ho=167.57e3;

% h4, qtsb
h4=qav; qtsb=qbr-h4;

% ha, hb
ha=271.93e3;
hb=ha+va*(pb-pa);
h=[ha hb hc hd he hf];

% wtpump, welpump
wtpump=abs(hb-ha);
welpump=wtpump/Vmekpump;

% wtT, welgenat
wtT=he-(hf*(1-avf_g)+hg*avf_g);
welgenat=wtT*Vmekat*Vmekatgen;

% mpv
mpv=Pacnet/(welgenat-welpump);

%Pgennet
Pgennet=(welGEN*mpluft+welgenat*mpv-welpump*mpv);

%Qpfjarr
Qpfjarr=Pgennet/alpha;

%Qpfv
Qpfjarra=mpv*(avf_g*hg+(1-avf_g)*hf-ha);
Qpfv=Qpfjarr-Qpfjarra;

%QpAC
QpAC=(he-hb)*mpv;

%Qpavgas
Qpavgas=cp*(T4-(T5+K))*mpluft;

%Qptills
Qptills=(he-hb)*mpv-Qpavgas+Qpfv;

% mpbr
mpbrtot=mpbr1+Qptills/Hi;
mpbr2=mpbrtot-mpbr1;

qtills=Qptills/(mpbrtot-mpbr1);

% mpfjarr
cvatten=4.18e3;
mpfjarr=Qpfjarr/(cvatten*(Tp-To));

%Veltot
Veltot=(Pgennet)/(mpbrtot*Hi);

% Vtot
Vtot=(Pgennet+Qpfjarr)/(mpbrtot*Hi);

% EB
Qprokgas=qav*mpluft+Qptills-QpAC-Qpfv;

IN=Qptills+qFB*mpluft+welpump*mpv;
UT=(welpump-wtpump)*mpv+(wtT-welgenat)*mpv+welgenat*mpv+Qpfjarr+welGEN*mpluft+(wtGT-waxk-welGEN)*mpluft+(qFB-qAM)*mpluft+(waxk-wtk)*mpluft+Qprokgas;

%% Avverknigstid

Pris1=(7.92e10/3.464)*0.8/(1000*3600);
d_pris1=22000*0.8-Pris1;
Av1=120000/d_pris1;

Pris2=((7.92e10/3.548)*0.6+(7.92e10/3.531)*0.4)*0.8/(3600*1000);
d_pris2=22000*0.8-Pris2;
Av2=80000/d_pris2;

x=linspace(0,20);
Pris1x=Pris1*x + 120000;
Pris2x=Pris2*x + 80000;
Pris3x=17600*x;
hold on
plot(x,Pris1x);
plot(x,Pris2x);
plot(x,Pris3x);

figure;
Pris21x=7605.9*x+120000;
Pris22x=7770.8*x+80000;
hold on
plot(x,Pris21x);
plot(x,Pris22x);
plot(x,Pris3x);

%% X
Veltot2=Veltot-0.11;
Pgennet2=Veltot2*(mpbrtot*Hi);
d_Pgennet=Pgennet-Pgennet2;


COb=0.1e-6; COn=0.06e-6; VCOa=0.9;
mpbrb=0.3*mpbrtot;
mpbrn=0.7*mpbrtot;
COp=COb*mpbrb*Hi+COn*mpbrn*Hi;
COak=d_Pgennet/(VCOa*COp);

COut=COp-(COp*VCOa);



