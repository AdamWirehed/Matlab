% NEARESTNEIGHBOR3 Funktion som plockar ut positionen av det minsta talet (som inte �r 0) i en
% rad i en matris.
%
% NEARESTNEIGHBOR3 Funktion som plockar ut positionen av det mista talet
% (som inte �r 0) i en rad i en matris med en for-loop. Om det minsta talet ligger i kolonn "n" 
% s� letar loopen efter det minsta talet i rad "n" n�sta omg�ng. Positionen av det
% minsta talet i varje rad i matrisen l�ggs i listan TourList. 
%
% INPUT: Matris
%
% OUTPUT: TourList = "Resv�g" i matrisen
%
% TME136 (c) Adam Wirehed 2016-10-12.

function y=nearestneighbor3(Matrix,Start)
q=Start;    %S�tter startstaden som variabeln q
TourList=[]; %Skapar en tom matris 
Bes=0;      
Matrix(:,q)=Bes; %S�tter avst�ndet till startstaden till 0 s� att den inte �ker tillbaks

for t=1:length(Matrix)-1   %S�tter lenght - 1 eftersom annars n�r vi har �kt till alla st�der f�rutom till startdestination s� �ker vi automatiskt till staden i kolonn 1 vilket vi inte vill g�ra.
    Matrix(~Matrix)=Inf; 
    [~,i]=min(Matrix(q,:)); %Plockar ut det minsta talet (som inte �r noll) p� plats 'i' i rad 'q'.
    TourList=[TourList i];  %L�gger in v�rdet 'i' (som �r staden p� plats 'i' i 'Matrix' och 
                            %l�gger in den i matrisen TourList 
    q=i;                    %V�rdet p� kolonnen 'i' �r den rad loopen kommer leta efter det minsta talet
                            %n�sta runda
    Matrix(:,i)=Bes;        %Kolonnen som loopen h�mta det minsta talet ifr�n fylls med v�rdet som variabeln Bes
                            %�r tilldelad (dvs. noll) f�r att f�rhindra att loopen "�ker" tillbaks till staden
end
TourList=[Start TourList Start]; %Startstaden l�ggs till i b�rjan och slutet p� matrisen f�r att visa
                                 %att man �ker fr�n starten och sen
                                 %tillbaks
y=TourList;
