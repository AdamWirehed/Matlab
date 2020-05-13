%% 1

%Se LinLV4Vinkel

%% 2

%Se LinLV4Spegling

%% 3
P=[5 10 4 5; 5 10 12 5];
close all
figure
plot(P(1,:), P(2,:))
hold on
fplot(@(x)1/2-0.5*x);
Ny=LinLV4Spegling([P(1,:); P(2,:); 0 0 0 0],1,2,0,1);
plot(Ny(1,:), Ny(2,:));
axis equal

%% 4

%Se LinLV4Rot

%% 5

%Se cube
