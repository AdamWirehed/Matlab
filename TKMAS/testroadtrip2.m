
clear all
clear workspace
clc

googleString=['https://maps.googleapis.com/maps/api/directions/json?origins='...
    'Stockholm|Ystad|Lund' '&destinations=' 'Stockholm|Ystad|Lund' '07073&key=AIzaSyC6Dy21sD_HRmPI5iDqGfBSdfE0khj-A-Y'];
data=webread(googleString);