%========================================================
% Uppgift 5
%
% Datornummer:
% 
% Anonym tentamenskod:
% 
% Tentamensdatum: 2014-01-15
%
%========================================================
% Programbeskrivning:
% Nedanstående program ....
% 
%
%
%========================================================
clear variables

X0=[0.1,0.1,0.1]';              %Startvärde
f=@(t,X)Lorenz(X);              %Funktionshandtag
[t,X]=ode45(f,[0 100],X0);      %Tidsstegslösning
%Tidsstegslösaren ode45 ger en output så att t är tiden
%med de intervall som lösningen beskrivs med, X(:,1) är
%lösningen för den första variabeln och X(:,n) för den
%n:te.