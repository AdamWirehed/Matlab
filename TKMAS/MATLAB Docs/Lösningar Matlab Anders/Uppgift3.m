%========================================================
% Uppgift 3
%
% Datornummer=Anders T. Johansson (c) Lösning.
% 
% Tentamensdatum: 2013-08-23
%
%========================================================
% Programbeskrivning:
% Program som trixar med cykloider.
%
%
%========================================================
clc
clear variables
close all
%% 3a) Rita en cykloid som ges av uttrycken i uppgiften.
r=input('Vilken radie vill du ha på din cykloid?');
N=input('Hur många cirklar ska ritas?');%tillägg från 3c)

t=linspace(0,2*pi,200);                 %skapa tidsvektor.

x=(r*(t-sin(t)));                       %Def. av x enl. uppg.
y=(r*(1-cos(t)));                       %Def. av y enl. uppg.

plot(x,y,'g--');                        %Plotta med streckad grön linje

%% 3b) Funktionsfil som ritar x antal cirklar också. Se RitaCikel.m

%% 3c) Rita N cirklar också
tn=linspace(0,2*pi,N);                  %N stycken tn-värden enl.
for a=1:N                               %uppgiften.
    hold on;                            %Rita i cykloidfiguren
    RitaCirkel(tn(a)*r,r,r);            %och använd RitaCirkel
end
axis equal                              %...med lika stora axlar
xlabel('x')                             %och x- och y-axlar
ylabel('y')                             %och titel enl. uppgift.
title(sprintf('Cykloid samt %u cirklar med radie r=%d',N,r));


%% EXTRA FÖRTYDLIGANDE: (Vad menas med punkt på rullande cirkel?)
% De tre raderna nedan plottar just punkten på cirkeln som beskriver
% cykloiden då cirkeln rullar.
% xn=(r*(tn-sin(tn)));                    %Def. av x-punkt
% yn=(r*(1-cos(tn)));                     %Def. av y-punkt
% plot(xn,yn,'.m');                        %Plotta punkt
