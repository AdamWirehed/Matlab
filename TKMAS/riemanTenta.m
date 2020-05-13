function S=riemanTenta(n)
S=0;
x=0;
y=1;
while x < 1
    x=x+1/n;
    dS=((x-(1/n)+x)/2).^2/n;
    S=S+dS;
end
