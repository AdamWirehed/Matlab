g=@(x) x+a.*(2*k*x-1);

k=0.6;
a=-0.5;
x0=1;

iterationer=3;

svar=fixpunkt(g,x0,iterationer);

svar
