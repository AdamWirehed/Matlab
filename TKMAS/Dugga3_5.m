%P3=sin(a*x)*cos(b*x)+a*cos(a*x)*cos(b*x)-b*sin(a*x)*sin(b*x)*(x-0)...
    %+(1/2)*((-(a^2)*sin(a*x)*cos(b*x)+(-a*b*2*cos(a*x))*sin(b*x))+(-b^2*sin(a*x)*cos(b*x)))...
    %*(x-0)^2+(1/6)*((-a^3-3*a*b^2)*cos(a*x)*cos(b*x)+(b^3+3*a^2*b)*sin(a*x)*sin(b*x))*(x-0)^3
    
syms x
syms a
syms b
syms xr
f=sin(a*x)*cos(b*x);
D1=diff(f,x);
D2=diff(D1,x);
D3=diff(D2,x);

P3=f+(D1*(xr-x))+((1/2)*D2*((xr-x)^2))+((1/6)*D3*((xr-x)^3))
(x - xr)^3*((a^3*cos(a*x)*cos(b*x))/6 - (b^3*sin(a*x)*sin(b*x))/6 + (a*b^2*cos(a*x)*cos(b*x))/2 - (a^2*b*sin(a*x)*sin(b*x))/2) - (x - xr)^2*((a^2*cos(b*x)*sin(a*x))/2 + (b^2*cos(b*x)*sin(a*x))/2 + a*b*cos(a*x)*sin(b*x)) + (b*sin(a*x)*sin(b*x) - a*cos(a*x)*cos(b*x))*(x - xr) + cos(b*x)*sin(a*x)