function x=roots2(a,b,c)
    %Beskrivning
    p=b/a;
    q=c/a;
    x(1)=-p/2-sqrt(p^2/4-q);
    x(2)=-p/2+sqrt(p^2/4-q);
    