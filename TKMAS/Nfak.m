function [Nfak]=fak(N)
n=1
Nfak=1
while n<N
    n=n+1
    Nfak=Nfak.*n
end
