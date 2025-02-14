close all
clear all

x = linspace(1300,1700,41); %PulseWidth
yr = [37.5 37.5 37.5 37.5 37.5 37.5 37 37.5 37 37 36 35.5 34.5 33 32 29.5 25 21 15.5 10 4 0 -2 -7.5 -14 -18.5 -25.5 -28 -31 -34 -35 -36 -36.5 -37 -37.5 -37.5 -38 -38 -38 -38 -38];
yl = [-38 -37.5 -37.5 -37.5 -37.5 -37.5 -37.5 -37.5 -37.5 -37.5 -37 -36.5 -35.5 -34.5 -33.5 -31 -28 -24.5 -19.5 -14 -7.5 -2 0 3.5 10 16 21.5 26.5 30 33 35 36 37 37.5 38 38 37.5 38 38 38 38];

plot(x, yr)
hold on
plot(x, yl)
legend;
ylabel('[RPM]');
xlabel('Pulse Width [µs]');