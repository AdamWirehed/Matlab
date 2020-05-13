% DRAGESTERASSIGNMENT Script som ber�knar den "optimala" v�xlingen i en bil
% vid en viss hasighet.
%
% DRAGSTERASSIGNMENT Script som berk�nar den "optimala" v�xlingen i en bil
% vid en viss hastighet med hj�lp av 4st formler som ber�knar varvtal,
% bilenshastighet, moment och motorns effekt. Detta g�rs som till
% funktioner som plottas i en graf d�r sk�rningspunkterna sedan r�knas ut.
% Detta testas sedan i en dragster-simulator som �r kodad av Caster
% Chalmers.
%
% INPUT: Statisik i form av "VehcileData.mat".
%
% OUTPUT: Graf med motorns effekt plottad mot bilens hastighet 
%
% TME136 (c) Adam Wirehed 2016-10-12.

run('Matlab_Dragster_Assignment.p');        %Kodat av Caster Chalmers

load('vehicleData.mat');

Vbil=cell(1:4); %F�rdefiniation av cellmatriser
P=cell(1:4);
V=cell(1:4);
for n=1:4
RPMh=rpmVector./(gearRatios(n).*finalDriveRatio); %R�knar ut varvtalen p� hjulen beroende p� v�xel
Vbil{n}=((2*pi)/60)*wheelRadius*RPMh*3.6;        %R�knar ut bilens hastighet (i km/h) vid ett vist varvtal p� hjulen i v�xel n
Mhj=torqueVector.*gearRatios(n).*finalDriveRatio;         %R�knar ut vridmomentet p� hjulen
P{n}=(Mhj.*Vbil{n})./(wheelRadius);                     %R�knar ut effekten
V{n}=@(x)(spline(Vbil{n},P{n},x));                        %G�r om datapunkterna i Vbil och P i v�xel 1 till en anonym funktion 
end

Vax=cell(1:3);
for n=1:3
Vax{n}=@(x) V{n}(x)-V{n+1}(x);                      %D�r Vax{n}==0 �r V{n}=V{n+1} 
end
                                
vsol1=fzero(Vax{1},70);                                   %Tar fram sk�rningspunkten mellan funktionerna V1 och V2
vsol2=fzero(Vax{2},130);                                  %F�r V2 och V3
vsol3=fzero(Vax{3},150);                                  %F�r V3 och V4

figure
for n=1:4
hold on
plot(Vbil{n},P{n});                       %Plottar effekten bilen har i f�rsta v�xeln vid en viss hastighet         
end

plot(vsol1,V{1}(vsol1),'.r','MarkerSize',15); %Plottar en r�d prick i sk�rningspunkten
plot(vsol2,V{2}(vsol2),'.r','MarkerSize',15);
plot(vsol3,V{3}(vsol3),'.r','MarkerSize',15);
xlabel('Velocity [km/h]');                  %Skriver ut en beskrivning p� x-axeln
ylabel('P [W]');                            %Skriver ut en beskrivning p� y-axeln
legend('1st gear','2nd gear','3rd gear','4th gear','Shift!','Location','SouthEast'); %En ruta i det nedre h�gra h�rnet som beskiver linjerna i grafen l
