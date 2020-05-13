function gear_demand = student_AutomaticGearbox(Gear, RPM, LongAcc, Velocity, Throttle, Distance, TimeLap)
    
load('vehicleData.mat');

Vbil=cell(1:4); %Fördefiniation av cellmatriser
P=cell(1:4);
V=cell(1:4);
for n=1:4
RPMh=rpmVector./(gearRatios(n).*finalDriveRatio); %Räknar ut varvtalen på hjulen beroende på växel
Vbil{n}=((2*pi)/60)*wheelRadius*RPMh*3.6;         %Räknar ut bilens hastighet (i km/h) vid ett vist varvtal på hjulen i växel n
Mhj=torqueVector.*gearRatios(n).*finalDriveRatio; %Räknar ut vridmomentet på hjulen
P{n}=(Mhj.*Vbil{n})./(wheelRadius);               %Räknar ut effekten
V{n}=@(x)(spline(Vbil{n},P{n},x));                %Gör om datapunkterna i Vbil och P i växel 1 till en anonym funktion 
end

Vax=cell(1:3);
for n=1:3
Vax{n}=@(x) V{n}(x)-V{n+1}(x);                    %Sätter V{n}=V{n+1} vid ett visst x (hastighet)
end
                                
vsol1=fzero(Vax{1},70);                           %Tar fram skärningspunkten mellan funktionerna V1 och V2
vsol2=fzero(Vax{2},130);                          %För V2 och V3
vsol3=fzero(Vax{3},150);                          %För V3 och V4

    % Convert m/s to km/h
    Speed = Velocity * 3.6;
    
    % Check the speed and determine gear
    if Speed < vsol1                           %Om hastigheten är lägre än vsol1 så ska bilen köra i första växeln
        gear_demand = 1;
    elseif Speed < vsol2 && Speed > vsol1      %Om hastigheten är högre än vsol1 och lägre än vsol2 så ska bilen köra i andra växeln
        gear_demand = 2;
    elseif Speed < vsol3 && Speed > vsol2
        gear_demand = 3;
    elseif Speed > vsol3
        gear_demand = 4;
    end

end