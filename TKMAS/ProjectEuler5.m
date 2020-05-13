%Project Euler 5
%2520 är det minsta talet jämnt delbrt med alla tal 1 tom. 10 vilket 
%är det minsta talet jämt delbart med alla heltal 1 tom. 20?

%Planering:
    %Hur avgör vi om talet är delbart med 1:N? (rem eller mod)
    %Avgör om det tal vi funnit som uppfyller kravet är minst (Börja
    %nerifrån dvs. det första talet vi hittar är minst)
    %Avgör vilka tal vi ska använda som kandidater (Alla!)

%En idé: Börja med brute force.

%Kod PE5v1 (som funktion)

function DF=ProjectEuler5(LvL)
DF=1;
tic;
while 1 %(Samma sak som 1==1, while 1 är alltid sant vilket gör det till en oändlighetsloop)
    DF=(DF+10)-1;
    isDivisible=0;
    for a=2:LvL
        if rem(DF,a)~=0
            isDivisible=0;break;
        else
            isDivisible=1;
        end
    end
    if isDivisible==1
        return;
    end
end
tid1=toc;
tid1
