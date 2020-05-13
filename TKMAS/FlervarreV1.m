%% 1
t=linspace(-1000*pi,0);
a=1; b=10;
x=a*cos(t).*t; y=a*sin(t).*t; z=b*t;

plot3(x,y,z);

%% 2
a=12;
r=[0 a];
teta=[0 2*pi];
X=r.*cos(teta); Y=r.*sin(teta);

[X,Y]=meshgrid(-10:0.1:10);

Z1=X.^2+Y.^2; % Figur 12.5
surf(X,Y,Z1);

%% 3
%f(x,y)=C => ex. X.^2 + Y.^2 = C
C=1e13;
a=12;
r=[0 a];
teta=[0 2*pi];
[X,Y]=meshgrid(-10:0.1:10);
%X=r.*cos(teta); Y=sqrt(C-X.^2);


Z=X.^2+Y.^2;
surfc(X,Y,Z);
figure
contour(X,Y,Z);

%% 4

x=linspace(0,5);
y=x; z=x;
[X,Y,Z]=meshgrid(x,y,z);
V=X.^2+Y.^2+Z.^2;
isosurface(X,Y,Z,V,4)
axis('equal')
grid on; hold on
isosurface(X,Y,Z,V,2)

