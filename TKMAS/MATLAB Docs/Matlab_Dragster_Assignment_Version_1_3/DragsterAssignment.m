% DRAGESTERASSIGNMENT Script som beräknar den "optimala" växlingen i en bil
% vid en viss hasighet.
%
% DRAGSTERASSIGNMENT Script som berkänar den "optimala" växlingen i en bil
% vid en viss hastighet med hjälp av 4st formler som beräknar varvtal,
% bilenshastighet, moment och motorns effekt. Detta görs som till
% funktioner som plottas i en graf där skärningspunkterna sedan räknas ut.
% Detta testas sedan i en dragster-simulator som är kodad av Caster
% Chalmers.
%
% INPUT: Statisik i form av "VehcileData.mat".
%
% OUTPUT: Graf med motorns effekt plottad mot bilens hastighet 
%
% TME136 (c) Adam Wirehed 2016-10-12.

run('Matlab_Dragster_Assignment.p');        %Kodat av Caster Chalmers

load('vehicleData.mat');

Vbil=cell(1:4); %Fördefiniation av cellmatriser
P=cell(1:4);
V=cell(1:4);
for n=1:4
RPMh=rpmVector./(gearRatios(n).*finalDriveRatio); %Räknar ut varvtalen på hjulen beroende på växel
Vbil{n}=((2*pi)/60)*wheelRadius*RPMh*3.6;        %Räknar ut bilens hastighet (i km/h) vid ett vist varvtal på hjulen i växel n
Mhj=torqueVector.*gearRatios(n).*finalDriveRatio;         %Räknar ut vridmomentet på hjulen
P{n}=(Mhj.*Vbil{n})./(wheelRadius);                     %Räknar ut effekten
V{n}=@(x)(spline(Vbil{n},P{n},x));                        %Gör om datapunkterna i Vbil och P i växel 1 till en anonym funktion 
end

Vax=cell(1:3);
for n=1:3
Vax{n}=@(x) V{n}(x)-V{n+1}(x);                      %Där Vax{n}==0 är V{n}=V{n+1} 
end
                                
vsol1=fzero(Vax{1},70);                                   %Tar fram skärningspunkten mellan funktionerna V1 och V2
vsol2=fzero(Vax{2},130);                                  %För V2 och V3
vsol3=fzero(Vax{3},150);                                  %För V3 och V4

figure
for n=1:4
hold on
plot(Vbil{n},P{n});                       %Plottar effekten bilen har i första växeln vid en viss hastighet         
end

plot(vsol1,V{1}(vsol1),'.r','MarkerSize',15); %Plottar en röd prick i skärningspunkten
plot(vsol2,V{2}(vsol2),'.r','MarkerSize',15);
plot(vsol3,V{3}(vsol3),'.r','MarkerSize',15);
xlabel('Velocity [km/h]');                  %Skriver ut en beskrivning på x-axeln
ylabel('P [W]');                            %Skriver ut en beskrivning på y-axeln
legend('1st gear','2nd gear','3rd gear','4th gear','Shift!','Location','SouthEast'); %En ruta i det nedre högra hörnet som beskiver linjerna i grafen l
