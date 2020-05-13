k=0.5;
g=9.81;
a=45;
v0=30;
t=linspace(0,3);
x=(v0*cosd(a)/2)*(1-exp(-k*t));
y=((v0*sind(a)/2)+(g/k.^2))*(1-exp(-k*t)-(g*t)/k);

plot(x,y)
hold on

for i=1:length(x)
    Ball=plot(x(i),y(i),'.r','MarkerSize',6);
    pause(5/length(x));
    delete(Ball);
    if i==length(x)
        for j=1:20
            Crash=plot(x(i),y(i),'.r','MarkerSize',6+3*j);
            pause(1/length(x));
        end
    end
end