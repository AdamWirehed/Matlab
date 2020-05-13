% NEARESTNEIGHBOR3 Funktion som plockar ut positionen av det minsta talet (som inte är 0) i en
% rad i en matris.
%
% NEARESTNEIGHBOR3 Funktion som plockar ut positionen av det mista talet
% (som inte är 0) i en rad i en matris med en for-loop. Om det minsta talet ligger i kolonn "n" 
% så letar loopen efter det minsta talet i rad "n" nästa omgång. Positionen av det
% minsta talet i varje rad i matrisen läggs i listan TourList. 
%
% INPUT: Matris
%
% OUTPUT: TourList = "Resväg" i matrisen
%
% TME136 (c) Adam Wirehed 2016-10-12.

function y=nearestneighbor3(Matrix,Start)
q=Start;    %Sätter startstaden som variabeln q
TourList=[]; %Skapar en tom matris 
Bes=0;      
Matrix(:,q)=Bes; %Sätter avståndet till startstaden till 0 så att den inte åker tillbaks

for t=1:length(Matrix)-1   %Sätter lenght - 1 eftersom annars när vi har åkt till alla städer förutom till startdestination så åker vi automatiskt till staden i kolonn 1 vilket vi inte vill göra.
    Matrix(~Matrix)=Inf; 
    [~,i]=min(Matrix(q,:)); %Plockar ut det minsta talet (som inte är noll) på plats 'i' i rad 'q'.
    TourList=[TourList i];  %Lägger in värdet 'i' (som är staden på plats 'i' i 'Matrix' och 
                            %lägger in den i matrisen TourList 
    q=i;                    %Värdet på kolonnen 'i' är den rad loopen kommer leta efter det minsta talet
                            %nästa runda
    Matrix(:,i)=Bes;        %Kolonnen som loopen hämta det minsta talet ifrån fylls med värdet som variabeln Bes
                            %är tilldelad (dvs. noll) för att förhindra att loopen "åker" tillbaks till staden
end
TourList=[Start TourList Start]; %Startstaden läggs till i början och slutet på matrisen för att visa
                                 %att man åker från starten och sen
                                 %tillbaks
y=TourList;
