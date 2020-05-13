%% Uppgift4
%
% Anonym tentamenskod: FACIT
%
% Datornummer:
%
% Tentamensdatum: 2016-10-25
%
% Beskrivning av Uppgift4:
% Nedanst�ende program ....
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

%�VERKURS: Hitta startv�rde baserat p� data-mark�r
startingpoint=17; %(Default: Given ledtr�d)
for k=1:length(a)
    if strcmp(a{k}{end},'Data fr�n senaste fyra m�naderna')...
            || strcmp(a{k}{end},'Data från senaste fyra månaderna')
        startingpoint=k;
    end
end

%�VERKURS: Hitta slutv�rde i data baserat p� mark�r
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