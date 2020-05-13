%Project Euler 5
%2520 �r det minsta talet j�mnt delbrt med alla tal 1 tom. 10 vilket 
%�r det minsta talet j�mt delbart med alla heltal 1 tom. 20?

%Planering:
    %Hur avg�r vi om talet �r delbart med 1:N? (rem eller mod)
    %Avg�r om det tal vi funnit som uppfyller kravet �r minst (B�rja
    %nerifr�n dvs. det f�rsta talet vi hittar �r minst)
    %Avg�r vilka tal vi ska anv�nda som kandidater (Alla!)

%En id�: B�rja med brute force.

%Kod PE5v1 (som funktion)

function DF=ProjectEuler5(LvL)
DF=1;
tic;
while 1 %(Samma sak som 1==1, while 1 �r alltid sant vilket g�r det till en o�ndlighetsloop)
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
