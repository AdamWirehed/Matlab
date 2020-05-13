%API-key: AIzaSyC4TN2eG7yyjc4t4UqckuPSx2GF9pOlaqU
%Koden gillar inte Manchester av n�gon anledning

clear all
clear workspace
clc
%Input
StartStad='�ngelholm';
Destinations='|Lund|�stersund|Stockholm';
Start=1;    %V�ljer vilken stad som vi vill starta i
%StartStad=(inputdlg('Vilken stad �r du i?', 's'));
%Destinations=(inputdlg('Vilka st�der vill du �ka till?', 's'));

%Resv�g
%�NDRA DENNA TILL DIRECTIONS OCH EN LOOP M�STE G�RAS, KOLLA testroadtrip.m
%BEH�VS INTE, KOLLA L�NGST NER
googleString=['https://maps.googleapis.com/maps/api/distancematrix/json?origins=' StartStad Destinations '&destinations=' StartStad Destinations '&ie=ANSI'];
data=webread(googleString); %H�mtar data f�r avst�nden mellan st�derna (om man k�r bil) som matas in och l�ses av funktionen webread och l�ggs i variabeln "data"

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
%f�r att f� fram den
%'snabbaste' resv�gen f�r
%v�ran roadtrip
for i=1:length(Tourlist)
    disp(data.destination_addresses{Tourlist(i),1});    %Skickar ut resv�gen i commandwindow
    %med startstaden
    %f�rst och sist i listan
end


%Plot i Google Maps
googleString2=['https://maps.googleapis.com/maps/api/directions/json?origin='...
    StartStad '&destination=' StartStad '&waypoints=' Destinations '&ie=ANSI'];
data2=webread(googleString2);       %H�mtar koordinatera f�r st�derna (om man k�r bil) som 
                                    %matas in och l�ses av funktionen webread och l�ggs i variabeln "data"

lon=[]; lat=[]; Coordinates=[];
for n=1:length(data2.routes.legs)
    Coordinates=[Coordinates data2.routes.legs(Tourlist(n)).start_location];
    lon=[lon data2.routes.legs(Tourlist(n)).start_location.lng];
    lat=[lat data2.routes.legs(Tourlist(n)).start_location.lat];
end
ResvagLon=[lon lon(1)]; %Om man vill plotta resv�gen tillbaks till startdestinaiton
ResvagLat=[lat lat(1)];

plot(lon,lat,'.r','MarkerSize',25); %Plottar ut r�da punkter p� st�derna vi har bes�kt
hold on
plot(lon,lat,'k-','LineWidth', 1);  %Plotta ut v�r resv�g
plot_google_map;
%Google Map plotten �r kodad av Zohar Bar-Yehuda (Fr�ga Anders om
%h�nvisning)



       
 
    


           