function y=fixpunkt(g,x0,iterationer)
x=x0;
y=g(x);

for n=1:iterationer-1
    x=y;
    y=g(x);
end