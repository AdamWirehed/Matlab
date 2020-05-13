clear all
close all
clc

%% a)

ax = worldmap('World');
    setm(ax, 'Origin', [0 180 0])
    land = shaperead('landareas', 'UseGeoCoords', true);
    geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5])
    lakes = shaperead('worldlakes', 'UseGeoCoords', true);
    geoshow(lakes, 'FaceColor', 'blue')
    rivers = shaperead('worldrivers', 'UseGeoCoords', true);
    geoshow(rivers, 'Color', 'blue')
    cities = shaperead('worldcities', 'UseGeoCoords', true);
    geoshow(cities, 'Marker', '.', 'Color', 'red')
    
%% b)
fid=fopen('piratehavens.txt');
c=fgetl(fid);
n=1;
while c~=-1
    Piratehavens(n).lat=c(1,1:10);
    Piratehavens(n).lon=c(1,11:21);
    Piratehavens(n).stad=c(1,22:end);
    c=fgetl(fid);
    n=n+1;
end
    
 