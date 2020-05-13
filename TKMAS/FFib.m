%Fibonacci funktion

function y=FFib(x)
f=2;
fm1=1;
fm2=1;
for i=1:x-2
    f=fm1+fm2;
    fm2=fm1;
    fm1=f;
end
f

    
    