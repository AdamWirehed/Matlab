%Konstruktionsuppgift 2
clear all
clear variables

%% Givna värden

%E13
p   = 12e6;         %[Pa]    
Di  = 50e-3;        %[m] insida cylinder(använd till längd gavel)
Dy  = 58e-3;        %[m] 
d   = 24e-3;        %[m]
l   = 150e-3;       %[m] längd cylinderrör
h   = 25e-3;        %[m] längd distansring
b   = 5e-3;         %[m]

Skruv = skruv(2);          %M8
d1    = Skruv(1);          %innerdiameter
d2    = Skruv(2);          %medeldiameter
dw    = Skruv(3);          %anliggningsdiameter
m     = Skruv(4)*10^-3;    %metriskgänga
dh    = Skruv(5);          %frigående hål, medel
P     = Skruv(6);          %stigning

Lskruv  = h+2*b+l;   %[m]
E_steel = 210e9;     %[Pa]
E_al    = 69e9;      %[Pa] Distansring
Di_dist = Di;        %[m]
Dy_dist = Dy+80e-3;  %[m]

%% Area
Area_skruv = pi*((m/2)^2);                                       %[m] 
Area_cylr  = (pi*((Dy/2))^2)-pi*((Di/2)^2);                      %[m]
Area_dist  = (pi*(((Dy_dist)/2))^2)-pi*(((Di_dist)/2)^2)-4*Area_skruv; %[m] 
Area_cylp  = pi*((Di/2)^2);                                      %[m]

%% Styvheter
%Alla är seriekopplade
cs_ut=4*((E_steel*Area_skruv)/Lskruv);      %hela förbandet, varje skruv bidrar med styvhet 
ck_ut=((1/((E_steel*Area_cylr)/l))+(1/((E_al*Area_dist)/h)))^-1;

cs_in=(E_al*Area_dist)/h;
ck_in=((l/(E_steel*Area_cylr)+(1/cs_ut)))^-1;

%% Förspänningskraften
Fn_ut   = p*1.25*Area_cylp;                %[N]
Fn_in   = p*1.25*(Area_cylp-pi*((d/2)^2)); %[N]

%Glapp när Fk=0, F0 minsta tillåtna värde, F0 måste vara större än detta
F0_ut  = Fn_ut*(ck_ut/(cs_ut+ck_ut));
F0_in  = Fn_in*(ck_in/(cs_in+ck_in));

if F0_ut > F0_in
    F0glapp = F0_ut;
else
    F0glapp = F0_in;
end

F0 = F0glapp;

%% Sättning
deltapl = 28.9e-6;   %[m]

deltaF0_in = (deltapl*cs_in*ck_in)/(cs_in+ck_in);
deltaF0_ut = (deltapl*cs_ut*ck_ut)/(cs_ut+ck_ut);

if deltaF0_in > deltaF0_ut
    deltaF0 = deltaF0_in;
else
    deltaF0 = deltaF0_ut;
end

F0= F0 + deltaF0;

%%  Åtdragningsmoment

%Obehandlad skruv, obehandlad mutter, smorda ytor
friktion_max = 0.26;
friktion_maxb = 0.18;
friktion_min = 0.14; 
friktion_minb = 0.08;
rm = (dw+dh)/4; 

M_max = F0*(0.16*P+0.58*friktion_max*d2+friktion_maxb*rm); 

F0 = M_max/(0.16*P+0.58*friktion_min*d2+friktion_minb*rm);

%% Amplitud
Fn_uta   = p*Area_cylp;                %[N]
Fn_ina   = p*(Area_cylp-pi*((d/2)^2)); %[N]
%Krafter
Fs_ut = F0+(cs_ut/(cs_ut+ck_ut))*Fn_uta; 
Fk_ut = F0-(ck_ut/(cs_ut+ck_ut))*Fn_uta;

Fs_in = F0+(cs_in/(cs_in+ck_in))*Fn_ina;
Fk_in = F0-(ck_in/(cs_in+ck_in))*Fn_ina;

%Spänningsamlitud
F       = [Fs_ut Fk_in]; 
Asp     =  4*((pi/16)*(d1+d2)^2); 
sigma_a = (max(F)-min(F))/(2*Asp);  %hela förbandet

%% Maximal spänning
Fs_ut = F0+(cs_ut/(cs_ut+ck_ut))*Fn_ut;

sigma_max = Fs_ut/Asp;


