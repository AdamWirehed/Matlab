%========================================================
% Uppgift 2: Lorenz
%
% Datornummer=
% 
% Tentamensdatum: 2013-10-23
%
%========================================================

function Y=Lorenz(X)
%LORENZ: Funktion som beräknar värdet på de tre Lorenz-
%ekvationerna.
%
%
%Call: Y=Lorenz(X,t,r)

Y=[ 10*(X(2)-X(1));
    -X(1)*X(3)+30*X(1)-X(2);
    X(1)*X(2)-8/3*X(3)  ];