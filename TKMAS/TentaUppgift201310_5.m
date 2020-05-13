clc
close all
clear all

%% a)
n=201;
SpelPlan=zeros(n+2);

%% b)
SpelPlan=randi([0 1],size(SpelPlan));
% SpelPlan(2:end-1,2:end-1)=eye(n)+flipud(eye(n));
% SpelPlan((n-1)/2+2,(n-1)/2+2)=1;
% Häftigt mönster

%% c)
%se advancetime.m

%% d)
figure;
for n=1:50
    spy(SpelPlan);
    pause(0.25);
    SpelPlan=advancetime(SpelPlan);
end
    