function y=MinPiRaknare(tol)

A=1; N=6; E=1;

while E > tol
    N=2*N;
    A=sqrt(2-sqrt(4-A.^2));
    L=N*A/2;
    U=L/sqrt(1-(A.^2)/2);
    P=(U+L)/2;
    E=(U-L)/2;
    fprintf('V�rdet p� N �r %d. V�rdet p� E �r %3.2f. Och v�rdet p� P �r 
end
y=P;
