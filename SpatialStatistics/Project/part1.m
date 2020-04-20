close all
clear all

%% 1
path = pwd;
titan = imread(strcat(path, '/TMS016_data/titan.jpg'));
rosetta = imread(strcat(path, '/TMS016_data/rosetta.jpg'));

figTitan = figure(1);
imshow(titan);

figRosetta = figure(2);
imshow(rosetta);