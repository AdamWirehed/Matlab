x=0;
a=24;
b=5;
xr=0.1;

P3=(x - xr)^3*((a^3*cos(a*x)*cos(b*x))/6 - (b^3*sin(a*x)*sin(b*x))/6 + (a*b^2*cos(a*x)*cos(b*x))/2 - (a^2*b*sin(a*x)*sin(b*x))/2) - (x - xr)^2*((a^2*cos(b*x)*sin(a*x))/2 + (b^2*cos(b*x)*sin(a*x))/2 + a*b*cos(a*x)*sin(b*x)) + (b*sin(a*x)*sin(b*x) - a*cos(a*x)*cos(b*x))*(x - xr) + cos(b*x)*sin(a*x)