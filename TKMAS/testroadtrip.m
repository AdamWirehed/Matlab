
StartStad='Ängelholm'
Destination='Stockholm';

for n=1:length(Destination)
googleString2=['https://maps.googleapis.com/maps/api/directions/json?origin='...
    StartStad '&destination=' Destination(n) '&ie=ANSI'];
data2=webread(googleString2);
end
