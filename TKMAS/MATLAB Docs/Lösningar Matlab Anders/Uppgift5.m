%========================================================
% Uppgift 5
%
% Datornummer=Anders T. Johansson (c) Lösning.
% 
% Tentamensdatum: 2013-11-1
%
%========================================================
% Programbeskrivning:
% Nedanstående program Löser uppgift 5 ("Game of Life") i 
% tentan. Det handlar om algoritmer, nästlade loopar och
% en barnslig förtjusning i att leka med artificiellt
% liv, som en budgetversion av Sims.
% 
%========================================================
clc
close all
clear variables
%% Uppgift a (1p)
n=201;a=1000;                       %Definiera spelplansstorlek och antal 1                     
A=zeros(n+2);                       %Sätt upp nollmatris.

%% Uppgift b
% Randomiserad start, tar inte hänsyn till ev. tidigare etta på given pos.
% for II=1:a                          %Sätt ut a st 1:or.
%     row=randi(n)+1;                 %På randomiserad rad (inte första och
%     col=randi(n)+1;                 %sista) - även kolumnen ska vara rand.
%     A(row,col)=1;                   %...peta in en etta.
% end

% Strukturerade startvärden man kan testa för skojs skull:
%-------------------------------------------------------------------------
% Gångertecken:                                                         %|
A(2:end-1,2:end-1)=eye(n) + flipud(eye(n));                           %|
A((n-1)/2+2,(n-1)/2+2)=1;                                             %|
%                                                                       %|
% Minustecken                                                           %|
% A(102,2:end-1)=ones(1,201);                                           %|
%                                                                       %|
% Plustecken:                                                           %|
% A(102,2:end-1)=ones(1,201);                                           %|
% A(2:end-1,102)=ones(201,1);                                           %|
%-------------------------------------------------------------------------
%% Uppgift c - se funktionsfilen advanceTime.m

%% Uppgift d
timeFrame=400;                      %Sätt en tidsram (0.25*400=100s)
for III=1:timeFrame
    spy(A);                         %kolla på matrisen
    pause(0.25);                    %pausa
    A=advanceTime(A);               %ta ett steg framåt i tiden
end
close all