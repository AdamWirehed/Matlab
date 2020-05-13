%Punktlighet, plottar statestik fr�n en txt-fil
%
%Punktlighet, plottar punktlighetsstatestik fr�n Sverige och Tyskland p�
%ett intervall p� max 4 �r i ett stapeldiagram och en tabell i
%commandwindow. Anv�ndaren f�r upp ett f�nster som fr�gar om statistiken
%ska komma upp i commandwindow. 

%Skrivet av Adam Wirehed 19970930
%Datum 2016-09-29

%Punktlighet svensk- och tyskt�gtrafik
close all
clear all
clc

SWE=load('svenskPunktlighet.txt'); %L�ser alla variabler fr�n filen
GER=load('deutschesPunktlichkeit.txt'); %L�ser in alla variabler fr�n filen
VideoReader('Dramatic Look.mp4'); %Scrolla vidare, inget intressant h�r

%Variabeltilldelning
Sverige=SWE(:,3); %Kolonn med punktlighet i procent (Sverige)
Tyskland=GER(:,3); %Kolonn med punktlighet i procent (Tyskland)
Manad=SWE(:,1); %Kolonn med m�nader
ManadS=SWE(length(Manad),1);
Ar=SWE(:,2); %Kolonn med �r
Ar1=SWE(1,2); %Plockar ut det f�rsta �rtalet fr�n Sverige-filen
ArS=SWE(length(Ar),2); %Sista �ret
Ar2=0;
Ar3=0;
Ar4=0;

for y=1:length(Ar)  %Om det �r ett �rsskifte i tabellen tilldelas Ar2 det sista
    if SWE(y,2)>Ar1
        Ar2=Ar1+1;
    end
end
for y=length(Ar)    %Om det �r tv� �rsskiften i tabellen tilldelas Ar3 det sista
    if SWE(y,2)>Ar2
        Ar3=Ar2+1;
    end
end
for y=length(Ar)    %Om det �r tre �rsskiften i tabellen tilldelas Ar4 det sista
    if SWE(y,2)>Ar3
        Ar4=Ar3+1;
    end
end
    
Schweiz=([98.4,98.4]); %y-koordinater f�r Schweiz-punkterna
SchweizX=([0,length(Manad)+1]); %x-koordinat f�r Schweiz-punkterna

%Plot
bar1=bar([Tyskland,Sverige],'BarWidth',1.8); %Plottar staplar av den svenska och tyska punktligheten
set(bar1(2),'FaceColor',[0.635294139385223 0.0784313753247261 0.184313729405403]); %Ger dem svenska staplarna vinr�d f�rg
hold on %Plottar i samma f�nster
plot(SchweizX,Schweiz,'k--','LineWidth',2); %Plottar en svart streckad linje med storleken 2 mellan punkterna (0,98.4) (14,98.4)
title('J�mf�relse av punktlighet i t�gtrafiken mellan Sverige och Tyskland', 'FontSize',10); %Ger grafen en titel med storleken 9 p� texten
ylabel('punktlighet i %'); %Skriver "Punktlighet i %" p� y-axeln 
for i=1:length(Manad)
    M{i}=sprintf('%02i',Manad(i)); %Skapar en cellmatris med m�naderna som finns i txt-filen d�r talen presenteras med 2 siffor
end
set(gca,'xticklabel',M); %S�tter in m�naderna p� x-axeln

if Ar1~=0 && Ar2~=0 && Ar3>1 && Ar4>1   %4 �rtal skrivs ut
    text(2,-8,num2str(Ar1));  %Skriver det f�rsta �rtalet under x-axeln
    text(5,-8,num2str(Ar2));  %Skriver det andra �rtalet under x-axeln
    text(8,-8,num2str(Ar3));  %Tredje
    text(11,-8,num2str(Ar4)); %Fj�rde
elseif Ar1~=0 && Ar2~=0 && Ar3>1       %3 �rtal skrivs ut
    text(2,-8,num2str(Ar1));  %Skriver det f�rsta �rtalet under x-axeln
    text(6,-8,num2str(Ar2)); %Skriver det andra �rtalet under x-axeln
    text(10,-8,num2str(Ar3)); %Tredje
elseif Ar1~=0 && Ar2~=0                 %2 �rtal skrivs ut
    text(4,-8,num2str(Ar1));
    text(9,-8,num2str(Ar2));
elseif Ar1~=0                           %1 �rtal skrivs ut
    text(6,-8,num2str(Ar1));
end

legend('Tyskland','Sverige','Schweiz','Location','SouthEast'); %"L�da" i nedre h�gra h�rnet med beskrivningar om grafen 

%CommandWindow
G=questdlg('Vill du ha en tabell i commandwindow?', 'Statistik', 'Ja', 'Nej', '�verraska mig?', 'Nej'); %Ett f�nster poppar upp med titeln Statistik och de tre alternativen Ja, nej och �verraska mig n�r man k�r scriptet
switch G
    case 'Ja'

fprintf('Data �ver t�gs punktlighet mellan %u%02i och %u%02i \n',Ar1,SWE(1,1),ArS,ManadS)
disp(' ')
disp('                Procent punktliga passagerart�g')
disp('�r     M�nad         Sverige    Tyskland')
disp('------------------------------------------------') %^�vre delen av tabellen med titlar
    for i=1:length(Manad)
    fprintf('%d   %02i             %2.2f%%      %2.2f%% \n',Ar(i), Manad(i), Sverige(i), Tyskland(i)) %Skriver ut en tabell i commandwindow med 13 rader och 4 kolonner d�r tv� sista kolonnerna f�r ett procenttecken efter sig
    end
% ^ Svaret om du klickar ja
    case 'Nej'
% ^ Svret om du klickar nej
    case '�verraska mig?'
        close all
        V=mplay('Dramatic Look.mp4'); 
        play(V.DataSource.Controls)
% ^ Svaret om du klickar �verraska mig
end