%========================================================
% Uppgift 3b: RitaCirkel.m
%
% Datornummer=Anders T. Johansson (c) Lösning.
% 
% Tentamensdatum: 2013-08-23
%
%========================================================

function RitaCirkel(xc,yc,r)
%RitaCirkel: Funktion som ritar en cirkel med radien r och centrum i
%punkten (xc,yc).
%
% In:   xc -    cirkelcentrums x-koordinat
%       yc -    cirkelcentrums y-koordinat
%       r  -    cirkelns radie
%
% Call: RitaCirkel(xc,yc,r);

theta=linspace(0,2*pi,200);

x=xc+r*cos(theta);              %x enl. uppgift
y=yc+r*sin(theta);              %y enl. uppgift

plot(x,y,'LineWidth',2)         %Plotta enl. specifikation i uppg.
end