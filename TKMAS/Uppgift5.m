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
% Nedanst�ende program ....
% 
%
%
%========================================================
clear variables

X0=[0.1,0.1,0.1]';              %Startv�rde
f=@(t,X)Lorenz(X);              %Funktionshandtag
[t,X]=ode45(f,[0 100],X0);      %Tidsstegsl�sning
%Tidsstegsl�saren ode45 ger en output s� att t �r tiden
%med de intervall som l�sningen beskrivs med, X(:,1) �r
%l�sningen f�r den f�rsta variabeln och X(:,n) f�r den
%n:te.