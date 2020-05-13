function y=MinPiRaknare(tol)

A=1; N=6; E=1;

while E > tol
    N=2*N;
    A=sqrt(2-sqrt(4-A.^2));
    L=N*A/2;
    U=L/sqrt(1-(A.^2)/2);
    P=(U+L)/2;
    E=(U-L)/2;
    fprintf('Värdet på N är %d. Värdet på E är %3.2f. Och värdet på P är 
end
y=P;
