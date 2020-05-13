%Punktlighet, plottar statestik från en txt-fil
%
%Punktlighet, plottar punktlighetsstatestik från Sverige och Tyskland på
%ett intervall på max 4 år i ett stapeldiagram och en tabell i
%commandwindow. Användaren får upp ett fönster som frågar om statistiken
%ska komma upp i commandwindow. 

%Skrivet av Adam Wirehed 19970930
%Datum 2016-09-29

%Punktlighet svensk- och tysktågtrafik
close all
clear all
clc

SWE=load('svenskPunktlighet.txt'); %Läser alla variabler från filen
GER=load('deutschesPunktlichkeit.txt'); %Läser in alla variabler från filen
VideoReader('Dramatic Look.mp4'); %Scrolla vidare, inget intressant här

%Variabeltilldelning
Sverige=SWE(:,3); %Kolonn med punktlighet i procent (Sverige)
Tyskland=GER(:,3); %Kolonn med punktlighet i procent (Tyskland)
Manad=SWE(:,1); %Kolonn med månader
ManadS=SWE(length(Manad),1);
Ar=SWE(:,2); %Kolonn med år
Ar1=SWE(1,2); %Plockar ut det första årtalet från Sverige-filen
ArS=SWE(length(Ar),2); %Sista året
Ar2=0;
Ar3=0;
Ar4=0;

for y=1:length(Ar)  %Om det är ett årsskifte i tabellen tilldelas Ar2 det sista
    if SWE(y,2)>Ar1
        Ar2=Ar1+1;
    end
end
for y=length(Ar)    %Om det är två årsskiften i tabellen tilldelas Ar3 det sista
    if SWE(y,2)>Ar2
        Ar3=Ar2+1;
    end
end
for y=length(Ar)    %Om det är tre årsskiften i tabellen tilldelas Ar4 det sista
    if SWE(y,2)>Ar3
        Ar4=Ar3+1;
    end
end
    
Schweiz=([98.4,98.4]); %y-koordinater för Schweiz-punkterna
SchweizX=([0,length(Manad)+1]); %x-koordinat för Schweiz-punkterna

%Plot
bar1=bar([Tyskland,Sverige],'BarWidth',1.8); %Plottar staplar av den svenska och tyska punktligheten
set(bar1(2),'FaceColor',[0.635294139385223 0.0784313753247261 0.184313729405403]); %Ger dem svenska staplarna vinröd färg
hold on %Plottar i samma fönster
plot(SchweizX,Schweiz,'k--','LineWidth',2); %Plottar en svart streckad linje med storleken 2 mellan punkterna (0,98.4) (14,98.4)
title('Jämförelse av punktlighet i tågtrafiken mellan Sverige och Tyskland', 'FontSize',10); %Ger grafen en titel med storleken 9 på texten
ylabel('punktlighet i %'); %Skriver "Punktlighet i %" på y-axeln 
for i=1:length(Manad)
    M{i}=sprintf('%02i',Manad(i)); %Skapar en cellmatris med månaderna som finns i txt-filen där talen presenteras med 2 siffor
end
set(gca,'xticklabel',M); %Sätter in månaderna på x-axeln

if Ar1~=0 && Ar2~=0 && Ar3>1 && Ar4>1   %4 årtal skrivs ut
    text(2,-8,num2str(Ar1));  %Skriver det första årtalet under x-axeln
    text(5,-8,num2str(Ar2));  %Skriver det andra årtalet under x-axeln
    text(8,-8,num2str(Ar3));  %Tredje
    text(11,-8,num2str(Ar4)); %Fjärde
elseif Ar1~=0 && Ar2~=0 && Ar3>1       %3 årtal skrivs ut
    text(2,-8,num2str(Ar1));  %Skriver det första årtalet under x-axeln
    text(6,-8,num2str(Ar2)); %Skriver det andra årtalet under x-axeln
    text(10,-8,num2str(Ar3)); %Tredje
elseif Ar1~=0 && Ar2~=0                 %2 årtal skrivs ut
    text(4,-8,num2str(Ar1));
    text(9,-8,num2str(Ar2));
elseif Ar1~=0                           %1 årtal skrivs ut
    text(6,-8,num2str(Ar1));
end

legend('Tyskland','Sverige','Schweiz','Location','SouthEast'); %"Låda" i nedre högra hörnet med beskrivningar om grafen 

%CommandWindow
G=questdlg('Vill du ha en tabell i commandwindow?', 'Statistik', 'Ja', 'Nej', 'Överraska mig?', 'Nej'); %Ett fönster poppar upp med titeln Statistik och de tre alternativen Ja, nej och Överraska mig när man kör scriptet
switch G
    case 'Ja'

fprintf('Data över tågs punktlighet mellan %u%02i och %u%02i \n',Ar1,SWE(1,1),ArS,ManadS)
disp(' ')
disp('                Procent punktliga passagerartåg')
disp('År     Månad         Sverige    Tyskland')
disp('------------------------------------------------') %^Övre delen av tabellen med titlar
    for i=1:length(Manad)
    fprintf('%d   %02i             %2.2f%%      %2.2f%% \n',Ar(i), Manad(i), Sverige(i), Tyskland(i)) %Skriver ut en tabell i commandwindow med 13 rader och 4 kolonner där två sista kolonnerna får ett procenttecken efter sig
    end
% ^ Svaret om du klickar ja
    case 'Nej'
% ^ Svret om du klickar nej
    case 'Överraska mig?'
        close all
        V=mplay('Dramatic Look.mp4'); 
        play(V.DataSource.Controls)
% ^ Svaret om du klickar Överraska mig
end