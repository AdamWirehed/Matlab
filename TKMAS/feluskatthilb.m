function [Kmax,Kmin]=feluskatthilb(n,N)

for i=1:N
    IH=invhilb(n);
    b=randn(n,1);
    Exakt=IH*b;
    Fel=round(b,2);
    Db=b-Fel;
    Dx=IH*Db;

    K(i)=(norm(Dx)/norm(Exakt))/(norm(Db)/norm(b));
end

Kmax=max(K);
Kmin=min(K);
