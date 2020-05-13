function [Kfak]=fak(K)
k=1
Kfak=1
while k<K
    k=k+1
    Kfak=Kfak.*k
end
