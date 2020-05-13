function gear_demand = student_AutomaticGearbox(Gear, RPM, LongAcc, Velocity, Throttle, Distance, TimeLap)
    
load('vehicleData.mat');

Vbil=cell(1:4); %F�rdefiniation av cellmatriser
P=cell(1:4);
V=cell(1:4);
for n=1:4
RPMh=rpmVector./(gearRatios(n).*finalDriveRatio); %R�knar ut varvtalen p� hjulen beroende p� v�xel
Vbil{n}=((2*pi)/60)*wheelRadius*RPMh*3.6;         %R�knar ut bilens hastighet (i km/h) vid ett vist varvtal p� hjulen i v�xel n
Mhj=torqueVector.*gearRatios(n).*finalDriveRatio; %R�knar ut vridmomentet p� hjulen
P{n}=(Mhj.*Vbil{n})./(wheelRadius);               %R�knar ut effekten
V{n}=@(x)(spline(Vbil{n},P{n},x));                %G�r om datapunkterna i Vbil och P i v�xel 1 till en anonym funktion 
end

Vax=cell(1:3);
for n=1:3
Vax{n}=@(x) V{n}(x)-V{n+1}(x);                    %S�tter V{n}=V{n+1} vid ett visst x (hastighet)
end
                                
vsol1=fzero(Vax{1},70);                           %Tar fram sk�rningspunkten mellan funktionerna V1 och V2
vsol2=fzero(Vax{2},130);                          %F�r V2 och V3
vsol3=fzero(Vax{3},150);                          %F�r V3 och V4

    % Convert m/s to km/h
    Speed = Velocity * 3.6;
    
    % Check the speed and determine gear
    if Speed < vsol1                           %Om hastigheten �r l�gre �n vsol1 s� ska bilen k�ra i f�rsta v�xeln
        gear_demand = 1;
    elseif Speed < vsol2 && Speed > vsol1      %Om hastigheten �r h�gre �n vsol1 och l�gre �n vsol2 s� ska bilen k�ra i andra v�xeln
        gear_demand = 2;
    elseif Speed < vsol3 && Speed > vsol2
        gear_demand = 3;
    elseif Speed > vsol3
        gear_demand = 4;
    end

end