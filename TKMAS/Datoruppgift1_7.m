%Datauppgift 1.7
clear all;
close all;
clc;

%Input-del
format long
x=1;
a=sqrt(2);
%Beräkningsdel
for n=1:100
    x=(x+2/x)/2;
end

%Output-del
abs(x-sqrt(2))


