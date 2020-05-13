function RitaCirkel(xc,yc,r);
O=linspace(0,2*pi);
x=xc+r*cos(O);
y=yc+r*sin(O);

plot(x,y,'linewidth',2);