%% a)
%se nextgen
%% b)
generationSize=200;
startVektor=randi(2,1,generationSize)-1; %Eller randi([0 1],1,100)

%% c)
simulationTime=300;
cellAutomat=startVektor;
myRule=30;

for n=1:simulationTime
    startVektor=nextgen(startVektor,myRule);
    cellAutomat=[cellAutomat;startVektor];
end

%% d)
spy(cellAutomat);