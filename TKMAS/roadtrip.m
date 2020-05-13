%API-key: AIzaSyC4TN2eG7yyjc4t4UqckuPSx2GF9pOlaqU
%Koden gillar inte Manchester av någon anledning

clear all
clear workspace
clc
%Input
StartStad='Ängelholm';
Destinations='|Lund|Östersund|Stockholm';
Start=1;    %Väljer vilken stad som vi vill starta i
%StartStad=(inputdlg('Vilken stad är du i?', 's'));
%Destinations=(inputdlg('Vilka städer vill du åka till?', 's'));

%Resväg
%ÄNDRA DENNA TILL DIRECTIONS OCH EN LOOP MÅSTE GÖRAS, KOLLA testroadtrip.m
%BEHÖVS INTE, KOLLA LÄNGST NER
googleString=['https://maps.googleapis.com/maps/api/distancematrix/json?origins=' StartStad Destinations '&destinations=' StartStad Destinations '&ie=ANSI'];
data=webread(googleString); %Hämtar data för avstånden mellan städerna (om man kör bil) som matas in och läses av funktionen webread och läggs i variabeln "data"

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
%för att få fram den
%'snabbaste' resvägen för
%våran roadtrip
for i=1:length(Tourlist)
    disp(data.destination_addresses{Tourlist(i),1});    %Skickar ut resvägen i commandwindow
    %med startstaden
    %först och sist i listan
end


%Plot i Google Maps
googleString2=['https://maps.googleapis.com/maps/api/directions/json?origin='...
    StartStad '&destination=' StartStad '&waypoints=' Destinations '&ie=ANSI'];
data2=webread(googleString2);       %Hämtar koordinatera för städerna (om man kör bil) som 
                                    %matas in och läses av funktionen webread och läggs i variabeln "data"

lon=[]; lat=[]; Coordinates=[];
for n=1:length(data2.routes.legs)
    Coordinates=[Coordinates data2.routes.legs(Tourlist(n)).start_location];
    lon=[lon data2.routes.legs(Tourlist(n)).start_location.lng];
    lat=[lat data2.routes.legs(Tourlist(n)).start_location.lat];
end
ResvagLon=[lon lon(1)]; %Om man vill plotta resvägen tillbaks till startdestinaiton
ResvagLat=[lat lat(1)];

plot(lon,lat,'.r','MarkerSize',25); %Plottar ut röda punkter på städerna vi har besökt
hold on
plot(lon,lat,'k-','LineWidth', 1);  %Plotta ut vår resväg
plot_google_map;
%Google Map plotten är kodad av Zohar Bar-Yehuda (Fråga Anders om
%hänvisning)



       
 
    


           