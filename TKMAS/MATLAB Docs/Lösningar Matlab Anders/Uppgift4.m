%% Uppgift4
%
% Anonym tentamenskod: FACIT
%
% Datornummer:
%
% Tentamensdatum: 2016-10-25
%
% Beskrivning av Uppgift4:
% Nedanstående program ....
%
%
%
clear variables;close all;
%% a)
a=fileread('smhi-opendata_3_4_71420_20161024_075744.csv');
a=strsplit(a,'\n');
for k=1:length(a)
    a{k}=strsplit(a{k},';');
end

%ÖVERKURS: Hitta startvärde baserat på data-markör
startingpoint=17; %(Default: Given ledtråd)
for k=1:length(a)
    if strcmp(a{k}{end},'Data från senaste fyra månaderna')...
            || strcmp(a{k}{end},'Data frÃ¥n senaste fyra mÃ¥naderna')
        startingpoint=k;
    end
end

%ÖVERKURS: Hitta slutvärde i data baserat på markör
endpoint=length(a); %(Default: till slutet)
for k=startingpoint:length(a)
    if isempty(a{k}{1})
        endpoint=k-1;
    end
end

for k=startingpoint:endpoint
    vinddata(k-startingpoint+1)=str2double(a{k}{3});
end

%% b)
rose(vinddata);
set(gca,'View',[-90 90],'YDir','reverse');