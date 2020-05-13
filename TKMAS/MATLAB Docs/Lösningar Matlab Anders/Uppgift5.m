%========================================================
% Uppgift 5
%
% Datornummer=Anders T. Johansson (c) L�sning.
% 
% Tentamensdatum: 2013-11-1
%
%========================================================
% Programbeskrivning:
% Nedanst�ende program L�ser uppgift 5 ("Game of Life") i 
% tentan. Det handlar om algoritmer, n�stlade loopar och
% en barnslig f�rtjusning i att leka med artificiellt
% liv, som en budgetversion av Sims.
% 
%========================================================
clc
close all
clear variables
%% Uppgift a (1p)
n=201;a=1000;                       %Definiera spelplansstorlek och antal 1                     
A=zeros(n+2);                       %S�tt upp nollmatris.

%% Uppgift b
% Randomiserad start, tar inte h�nsyn till ev. tidigare etta p� given pos.
% for II=1:a                          %S�tt ut a st 1:or.
%     row=randi(n)+1;                 %P� randomiserad rad (inte f�rsta och
%     col=randi(n)+1;                 %sista) - �ven kolumnen ska vara rand.
%     A(row,col)=1;                   %...peta in en etta.
% end

% Strukturerade startv�rden man kan testa f�r skojs skull:
%-------------------------------------------------------------------------
% G�ngertecken:                                                         %|
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
timeFrame=400;                      %S�tt en tidsram (0.25*400=100s)
for III=1:timeFrame
    spy(A);                         %kolla p� matrisen
    pause(0.25);                    %pausa
    A=advanceTime(A);               %ta ett steg fram�t i tiden
end
close all