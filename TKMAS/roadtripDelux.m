% ROADTRIPDELUX Script som beräknar resvägen till åtta destinaioner som kan nås med bil
% från startdestinationen
%
% ROADTRIPDELUX Script som beräknar resvägen mellan åtta destinationer som kan nås med bil
% från startdestinationen. Använder sig Google Maps API för att beräkna
% avstånd mellan destinationer och en självkodad "nearestneighbor" funktion
% som beräknar den "snabbaste" resvägen.
%
% INPUT: Startstad och andra destinationer som kan nås med bil.
%
% OUTPUT: Resväg i textformat (CommandWindow) och en plot på en GoogleMaps
% karta, script av Zohar Bar-Yehuda, som markerar städerna med en röd prick
% och en svart linje som visar resvägen.
%
% TME136 (c) Adam Wirehed 2016-10-12.

clear workspace
close all
clc
%%
%Input
Start=1;    %Vi börjar i den första staden (är en input till min nearestneighbor funktion) 
StartStadI=(inputdlg('Vilken stad är du i?', 'Startdestination'));

if strcmpi(StartStadI,'Trollhättan')
    Fraga=questdlg('Är det Anders som rättar?','Viktig fråga','Ja','Nej','Nej');
    if strcmpi(Fraga,'Ja')
    msgbox('Varför vill du åka ifrån det bästa stället på hela jorden? Tänk över ditt beslut!');
    return
    elseif strcmpi(Fraga,'Nej')
    end
end

DestinationsI=(inputdlg('Vilka städer vill du åka till? (max åtta stycken) Skriv ett "|" mellan destinationerna', 'Destinations',[3 60],...
                {sprintf('Destination1|Destination2|Destination3...')})); %En input-box poppar upp som
                                                                            %frågar vilka städer man vill åka till
                                                                            %För tillfället måste det skrivas 
                                                                            %ett | innan och mellan varje stad i
                                                                            %DestinationsI
                                                                            %Det skrivs ett exempel i inputboxen med sprintf
StartStad=StartStadI{1};        %Gör om cellen med startstaden till en string
Destinations=DestinationsI{1};  %Gör om cellen med destinationerna till en string

%Resväg
googleString=['https://maps.googleapis.com/maps/api/distancematrix/json?origins=' StartStad '|' Destinations '&destinations=' StartStad '|' Destinations '&ie=ANSI'];
data=webread(googleString); %Hämtar data för avstånden mellan städerna (om man kör bil) som matas in och läses av funktionen webread och läggs i variabeln "data"
%Distance=zeros(size(data.rows.elements));
for i=1:length(data.rows)
    for r=1:length(data.rows)
        Distance(i,r)=[data.rows(i).elements(r).distance.value];
    end
end                         %Loopen skapar en cellmatris med storleken lenght(data.rows) x lenght(data.rows)...
%där Startstaden läggs i rad 1 och avstånden
%till de andra städerna läggs i kolonnerna i
%den raden. Staden i kolonn n i rad 1 har
%motsvarande sina avstånd till andra städer i
%rad n

Tourlist=nearestneighbor3(Distance,Start); %Använder min egna funktion nearestneighbor3
%för att få fram den 'snabbaste' resvägen för våran roadtrip
%%
%Plot i Google Maps
googleString2=['https://maps.googleapis.com/maps/api/directions/json?origin='...
    StartStad '&destination=' StartStad '&waypoints=' Destinations '&ie=ANSI'];
data2=webread(googleString2);       %Hämtar koordinatera för städerna (om man kör bil) som 
                                    %matas in och läses av funktionen webread och läggs i variabeln "data"                                   
lon=[]; lat=[];                     %Skapar två tomma matriser för latitud- och longitudkoordinaterna
for n=1:length(data2.routes.legs)
    lon=[lon data2.routes.legs(Tourlist(n)).start_location.lng];    %Lägger longitidkoordinaterna i lon-matrisen
    lat=[lat data2.routes.legs(Tourlist(n)).start_location.lat];    %Lägger latitudkoordinaterna i lat-matrisen
end
ResvagLon=[lon lon(1)]; %Om man vill plotta resvägen tillbaks till startdestinaiton så använder man sig av ResvagLon- och Lat i plot istället för lon och lat.
ResvagLat=[lat lat(1)];
%%
%Output
Resa=questdlg('Vill du se resvägen i CommandWindow,Popup-box eller enbart på kartan?','Resväg','CommandWindow','Popup-box','Enbart karta','Enbart karta');
if strcmpi(Resa,'CommandWindow')
    for i=1:length(Tourlist)
    disp(data.destination_addresses{Tourlist(i),1});    %Skickar ut resvägen i commandwindow
                                                        %med startstaden
                                                        %först och sist i listan
    end
elseif strcmpi(Resa,'Popup-box')
    Resvag=cell(size(data.destination_addresses));
    for i=1:length(Tourlist)
    Resvag{i}=(data.destination_addresses{Tourlist(i),1});    %Skickar ut resvägen i en Popup-box
                                                              %med startstaden först och
                                                              %först och sist i boxen
    end
    msgbox(Resvag,'Resväg');
elseif strcmpi(Resa,'Enbart karta')                           %Plottar enbart resvägen på kartan
end

plot_google_map; 
plot(lon,lat,'.r','MarkerSize',25); %Plottar ut röda punkter på städerna vi har besökt
hold on
plot(lon,lat,'k-','LineWidth', 1);  %Plotta ut vår resväg
pause(2/length(Tourlist));
                  % Acknowledgements:
                                    % Val Schmidt for his submission of get_google_map.m
                                    % Author:
                                    % Zohar Bar-Yehuda
                                    % Hämtat från https://se.mathworks.com/matlabcentral/fileexchange/27627-zoharby-plot-google-map
                                    
                                    %Google_map plot funktionen är kodad av Zohar Bar-Yehuda (Fråga Anders om hänvisning). Istället för att använda MatLabs egna 
                                    %världskarta (som enligt mig är ganska oatraktiv) så plottar jag mina punkter (städer) och linjer
                                    % mellan dem i en karta från GoogleMaps.


       
 
    


           