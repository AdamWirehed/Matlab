clear all; 
clc;

%% Given data

E_steel=210*10^9;   % Elasticitetsmodul f?r st?l
E_al=69*10^9;       % Elasticitetsmodul f?r aluminium  
p=15*10^6;          % Trycket i cylindern
Di=0.090;           % Innerdiameter p? cylinder
Dy=0.096;           % Ytterdiameter p? cylinder
d_stang=0.03;       % Diameter p? tryckst?ngen
L_cyl=0.4;          % L?ngden p? cylindern
b=0.008;            % Avst?ndet mellan cylinder och distansring
h=0.04;             % L?ngden p? distansringen
L_skruv=h+2*b+L_cyl;% L?ngden p? skruv.

%% Ber?kningsm?ssig styvheter

C_skruv=@(d)((E_steel*d^2*pi)/(L_skruv*4));
C_distansring=@(di,dy,d)((E_al*(dy^2-di^2-4*d^2)*pi)/(h*4));
C_cylinder=((Dy^2-Di^2)*pi*E_steel)/(4*L_cyl);

Cs1=@(d)(4*C_skruv(d));
Ck1=@(di,dy,d)(((1/C_cylinder)+(1/C_distansring(di,dy,d)))^-1);

Cs2=@(di,dy,d)(C_distansring(di,dy,d));
% Ck2=@(d)((C_cylinder)+((4*C_skruv(d))));
Ck2=@(d)(((1/C_cylinder)+(1/(4*C_skruv(d))))^-1);


%% Krafter pga trycket

F_N1=p*1.25*Di^2*pi/4;
F_N2=p*1.25*(Di^2-d_stang^2)*pi/4;


%% Skapar matriser

f01=zeros(8,1);
f02=f01;
df01=f01;
df02=f01;
nyf01=f01;
nyf02=f01;



Mtorque1=zeros(8,2);
Mtorque2=zeros(8,2);

dii=Dy;
dyy=zeros(8,1);

%% Friktionskoefficienter

my1= 0.14;
my1b=0.08;
my2= 0.26;
my2b=0.18;

%% Loopar och ber?kningar f?r varje m?jlig skruv.

for i=1:8
    
    M=skruv(i);
    rm=(M(5)+M(3))/4;
    d=M(4)*10^-3;
    dyy(i)=6*d+dii;
    
    f01(i)=(Ck1(dii,dyy(i),d)/(Ck1(dii,dyy(i),d)+Cs1(d)))*F_N1;
    f02(i)=(Ck2(d)/(Ck2(d)+Cs2(dii,dyy(i),d)))*F_N2;
    
    deltaplast=22.1*10^-6;
    
    df01(i)=deltaplast*Ck1(dii,dyy(i),d)*Cs1(d)/(Ck1(dii,dyy(i),d)+Cs1(d));
    df02(i)=deltaplast*Ck2(d)*Cs2(dii,dyy(i),d)/(Ck2(d)+Cs2(dii,dyy(i),d));
    
    nyf01(i)=f01(i)+df01(i);
    nyf02(i)=f02(i)+df02(i);
    
    Mtorque1(i,:)=[nyf01(i)*(0.16*M(6)+0.58*M(2)*my1+my1b*rm),...
        nyf01(i)*(0.16*M(6)+0.58*M(2)*my2+my2b*rm)];
    Mtorque2(i,:)=[nyf02(i)*(0.16*M(6)+0.58*M(2)*my1+my1b*rm),...
        nyf02(i)*(0.16*M(6)+0.58*M(2)*my2+my2b*rm)];
    
    F_Amp1(i)=F_N1/2*(Cs1(d)/(Cs1(d)+Ck1(dii,dyy(i),d)));
    F_Amp2(i)=F_N2/2*(Cs2(dii,dyy(i),d)/(Cs2(dii,dyy(i),d)+Ck2(d)));
    
    Asp=pi/16*(M(1)+M(2))^2;
    
    Sigma_amp1(i)=F_Amp1(i)/(4*Asp);
    Sigma_amp2(i)=F_Amp2(i)/(4*Asp);
    
    F_max1(i)=nyf01(i)+(Cs1(d)/(Cs1(d)+Ck1(dii,dyy(i),d)))*F_N1;
    F_max2(i)=nyf02(i)+(Cs2(dii,dyy(i),d)/(Cs2(dii,dyy(i),d)+Ck2(d)))*F_N2;
    
    Sigma_max1(i)=F_max1(i)/(4*Asp);
    Sigma_max2(i)=F_max2(i)/(4*Asp);
    
end