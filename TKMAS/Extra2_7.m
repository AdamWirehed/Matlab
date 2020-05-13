
a=0.5;
b=2;
c=1.6;
x=(a-b).*sin(t)-c.*sin((a/b-1).*t);
y=-(a-b).*cos(t)-c.*cos((a/b-1).*t);

t=linspace(-1.2*pi,1.2*pi);
figure;
plot(x,y);
while 1
    hold on
for i=4:length(t)
    train=plot(x(i:i-3),y(i:i-3),'ks');
    pause(3/length(t));
    delete(train);a
    %fult som fan, fråga någon
end
end
    
