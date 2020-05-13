function Aut=advanceTime(Ain)
%========================================================
% Uppgift 5c: advanceTime.m
%
% Datornummer=Anders T. Johansson (c) Lösning.
% 
% Tentamensdatum: 2013-11-1
%
%========================================================
% advanceTime: Funktion som får tiden att gå i Livets Spel.
% 
%========================================================
[n,m]=size(Ain);                        %Ta storlek på inputmatris
Aut=zeros([n,m]);                       %Definiera ut-matris
                        


for x=2:n-1                             %Loopa över SPELPLANENs rader...
    for y=2:m-1                         %...och kolumner.
        v=Ain(x-1:x+1,y-1:y+1);         %Ta ut 3x3-matris kring (x,y) och
        a=sum(sum(v));                  %räkna ut antalet ettor i denna.
        if Ain(x,y)                     %OM cellen lever (dvs==1)
            if a~=3&&a~=4               %men antalet grannar inte är 2 el 3
                Aut(x,y)=0;             %så ska cellen dö (dvs bli 0), 
            else                        %annars ska den fortsätta att leva
                Aut(x,y)=1;             %dvs vara ett. sätts i utmatrisen.
            end                         %(hela planen utvärderas samtidigt)
        else                            %OM cellen är död (dvs==0)
            if a==3                     %och antalet grannar är exakt tre
                Aut(x,y)=1;             %ska cellen väckas till liv, men
            else                        %annars så ska cellen förbli död.
                Aut(x,y)=0;
            end
        end
    end
end
                