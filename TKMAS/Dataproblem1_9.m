%Dataproblem 1.9
clear all
close all
clc

%Input-del
format long
x=4;
%Beräkningsdel
for N=1:10e6;
    x=x+4.*(((-1)^N)/(2.*N));
end

%Output-del
x