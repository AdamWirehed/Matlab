clear all;
x=0:0.01:pi;
y=5.*cos(x)+x.^2-4.*x;
figure; %öppnar ett nytt figurfönster
plot(x,y, ':k');
