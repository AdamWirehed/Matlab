clear all;
x=0:0.01:pi;
y=5.*cos(x)+x.^2-4.*x;
figure; %�ppnar ett nytt figurf�nster
plot(x,y, ':k');
