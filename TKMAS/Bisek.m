function c=Bisek(f,a,b,tol)
y=f(a);
Y=f(b);

while b-a>tol
    c=(a+b)/2;
    C=f(c);
    if y*C < 0
        b=c;
    elseif Y*C < 0
        a=c;
    else
        break
    end
end

        
    