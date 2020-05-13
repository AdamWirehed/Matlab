% ROADTRIPDELUX Script som ber�knar resv�gen till �tta destinaioner som kan n�s med bil
% fr�n startdestinationen
%
% ROADTRIPDELUX Script som ber�knar resv�gen mellan �tta destinationer som kan n�s med bil
% fr�n startdestinationen. Anv�nder sig Google Maps API f�r att ber�kna
% avst�nd mellan destinationer och en sj�lvkodad "nearestneighbor" funktion
% som ber�knar den "snabbaste" resv�gen.
%
% INPUT: Startstad och andra destinationer som kan n�s med bil.
%
% OUTPUT: Resv�g i textformat (CommandWindow) och en plot p� en GoogleMaps
% karta, script av Zohar Bar-Yehuda, som markerar st�derna med en r�d prick
% och en svart linje som visar resv�gen.
%
% TME136 (c) Adam Wirehed 2016-10-12.

clear workspace
close all
clc
%%
%Input
Start=1;    %Vi b�rjar i den f�rsta staden (�r en input till min nearestneighbor funktion) 
StartStadI=(inputdlg('Vilken stad �r du i?', 'Startdestination'));

if strcmpi(StartStadI,'Trollh�ttan')
    Fraga=questdlg('�r det Anders som r�ttar?','Viktig fr�ga','Ja','Nej','Nej');
    if strcmpi(Fraga,'Ja')
    msgbox('Varf�r vill du �ka ifr�n det b�sta st�llet p� hela jorden? T�nk �ver ditt beslut!');
    return
    elseif strcmpi(Fraga,'Nej')
    end
end

DestinationsI=(inputdlg('Vilka st�der vill du �ka till? (max �tta stycken) Skriv ett "|" mellan destinationerna', 'Destinations',[3 60],...
                {sprintf('Destination1|Destination2|Destination3...')})); %En input-box poppar upp som
                                                                            %fr�gar vilka st�der man vill �ka till
                                                                            %F�r tillf�llet m�ste det skrivas 
                                                                            %ett | innan och mellan varje stad i
                                                                            %DestinationsI
                                                                            %Det skrivs ett exempel i inputboxen med sprintf
StartStad=StartStadI{1};        %G�r om cellen med startstaden till en string
Destinations=DestinationsI{1};  %G�r om cellen med destinationerna till en string

%Resv�g
googleString=['https://maps.googleapis.com/maps/api/distancematrix/json?origins=' StartStad '|' Destinations '&destinations=' StartStad '|' Destinations '&ie=ANSI'];
data=webread(googleString); %H�mtar data f�r avst�nden mellan st�derna (om man k�r bil) som matas in och l�ses av funktionen webread och l�ggs i variabeln "data"
%Distance=zeros(size(data.rows.elements));
for i=1:length(data.rows)
    for r=1:length(data.rows)
        Distance(i,r)=[data.rows(i).elements(r).distance.value];
    end
end                         %Loopen skapar en cellmatris med storleken lenght(data.rows) x lenght(data.rows)...
%d�r Startstaden l�ggs i rad 1 och avst�nden
%till de andra st�derna l�ggs i kolonnerna i
%den raden. Staden i kolonn n i rad 1 har
%motsvarande sina avst�nd till andra st�der i
%rad n

Tourlist=nearestneighbor3(Distance,Start); %Anv�nder min egna funktion nearestneighbor3
%f�r att f� fram den 'snabbaste' resv�gen f�r v�ran roadtrip
%%
%Plot i Google Maps
googleString2=['https://maps.googleapis.com/maps/api/directions/json?origin='...
    StartStad '&destination=' StartStad '&waypoints=' Destinations '&ie=ANSI'];
data2=webread(googleString2);       %H�mtar koordinatera f�r st�derna (om man k�r bil) som 
                                    %matas in och l�ses av funktionen webread och l�ggs i variabeln "data"                                   
lon=[]; lat=[];                     %Skapar tv� tomma matriser f�r latitud- och longitudkoordinaterna
for n=1:length(data2.routes.legs)
    lon=[lon data2.routes.legs(Tourlist(n)).start_location.lng];    %L�gger longitidkoordinaterna i lon-matrisen
    lat=[lat data2.routes.legs(Tourlist(n)).start_location.lat];    %L�gger latitudkoordinaterna i lat-matrisen
end
ResvagLon=[lon lon(1)]; %Om man vill plotta resv�gen tillbaks till startdestinaiton s� anv�nder man sig av ResvagLon- och Lat i plot ist�llet f�r lon och lat.
ResvagLat=[lat lat(1)];
%%
%Output
Resa=questdlg('Vill du se resv�gen i CommandWindow,Popup-box eller enbart p� kartan?','Resv�g','CommandWindow','Popup-box','Enbart karta','Enbart karta');
if strcmpi(Resa,'CommandWindow')
    for i=1:length(Tourlist)
    disp(data.destination_addresses{Tourlist(i),1});    %Skickar ut resv�gen i commandwindow
                                                        %med startstaden
                                                        %f�rst och sist i listan
    end
elseif strcmpi(Resa,'Popup-box')
    Resvag=cell(size(data.destination_addresses));
    for i=1:length(Tourlist)
    Resvag{i}=(data.destination_addresses{Tourlist(i),1});    %Skickar ut resv�gen i en Popup-box
                                                              %med startstaden f�rst och
                                                              %f�rst och sist i boxen
    end
    msgbox(Resvag,'Resv�g');
elseif strcmpi(Resa,'Enbart karta')                           %Plottar enbart resv�gen p� kartan
end

plot_google_map; 
plot(lon,lat,'.r','MarkerSize',25); %Plottar ut r�da punkter p� st�derna vi har bes�kt
hold on
plot(lon,lat,'k-','LineWidth', 1);  %Plotta ut v�r resv�g
pause(2/length(Tourlist));
                  % Acknowledgements:
                                    % Val Schmidt for his submission of get_google_map.m
                                    % Author:
                                    % Zohar Bar-Yehuda
                                    % H�mtat fr�n https://se.mathworks.com/matlabcentral/fileexchange/27627-zoharby-plot-google-map
                                    
                                    %Google_map plot funktionen �r kodad av Zohar Bar-Yehuda (Fr�ga Anders om h�nvisning). Ist�llet f�r att anv�nda MatLabs egna 
                                    %v�rldskarta (som enligt mig �r ganska oatraktiv) s� plottar jag mina punkter (st�der) och linjer
                                    % mellan dem i en karta fr�n GoogleMaps.


       
 
    


           