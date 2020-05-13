function Aut=advanceTime(Ain)
%========================================================
% Uppgift 5c: advanceTime.m
%
% Datornummer=Anders T. Johansson (c) L�sning.
% 
% Tentamensdatum: 2013-11-1
%
%========================================================
% advanceTime: Funktion som f�r tiden att g� i Livets Spel.
% 
%========================================================
[n,m]=size(Ain);                        %Ta storlek p� inputmatris
Aut=zeros([n,m]);                       %Definiera ut-matris
                        


for x=2:n-1                             %Loopa �ver SPELPLANENs rader...
    for y=2:m-1                         %...och kolumner.
        v=Ain(x-1:x+1,y-1:y+1);         %Ta ut 3x3-matris kring (x,y) och
        a=sum(sum(v));                  %r�kna ut antalet ettor i denna.
        if Ain(x,y)                     %OM cellen lever (dvs==1)
            if a~=3&&a~=4               %men antalet grannar inte �r 2 el 3
                Aut(x,y)=0;             %s� ska cellen d� (dvs bli 0), 
            else                        %annars ska den forts�tta att leva
                Aut(x,y)=1;             %dvs vara ett. s�tts i utmatrisen.
            end                         %(hela planen utv�rderas samtidigt)
        else                            %OM cellen �r d�d (dvs==0)
            if a==3                     %och antalet grannar �r exakt tre
                Aut(x,y)=1;             %ska cellen v�ckas till liv, men
            else                        %annars s� ska cellen f�rbli d�d.
                Aut(x,y)=0;
            end
        end
    end
end
                