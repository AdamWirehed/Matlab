t=linspace(0,25,200);
x=2*sin(t);
y=2*cos(t);

figure;
while 1
for i=1:length(t)
    clf;
    plot(x,y); 
    hold on
    plot(x(i),y(i),'ks');
    pause(4/length(t));
end
end

%% snyggare variant
t=linspace(0,25,200);
x=2*sin(t);
y=2*cos(t);

figure;
plot(x,y);
axis equal;
hold on
for i=1:length(t)
    train=plot(x(i),y(i),'ks');
    pause(4/length(t));
    delete(train);
end

    