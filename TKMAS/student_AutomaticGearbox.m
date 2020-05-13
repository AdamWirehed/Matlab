function gear_demand = student_AutomaticGearbox(Gear, RPM, LongAcc, Velocity, Throttle, Distance, TimeLap)
    
load('vehicleData.mat');

for n=1:4
RPMh{n}=rpmVector./(gearRatios(n).*finalDriveRatio); %Räknar ut varvtalen på hjulen beroende på växel
Vbil{n}=((2*pi)/60)*wheelRadius*RPMh{n}.*3.6         %Räknar ut bilens hastighet (i km/h) vid ett vist varvtal på hjulen i växel n
end

Mhj=torqueVector.*finalDriveRatio;                   %Räknar ut vridmomentet på hjulen

for n=1:4
P{n}=(Mhj.*rpmVector)./(wheelRadius);            %Räknar ut effekten
end


plot(Vbil{1},P{1});
hold on
plot(Vbil{2},P{2});
hold on
plot(Vbil{3},P{3});
hold on
plot(Vbil{4},P{4});

    % Convert m/s to km/h
    Speed = Velocity * 3.6;
   
    % Check the speed and determine gear
    if Speed < 74
        gear_demand = 1;
    elseif Speed > 74 && Speed < 125
        gear_demand =2;
    elseif Speed > 125 && Speed < 179
        gear_demand = 3;
    elseif Speed > 179
        gear_demand = 4;
    end

end