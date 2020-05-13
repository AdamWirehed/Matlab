function ut=kryptering(in,Nyckel)

Fullnyckel=in;  %fördefiniera den fullanyckeln

for a=1:length(in)
    index=rem(a,length(Nyckel));
    if index==0
        index=length(Nyckel);
    end
    Fullnyckel(a)=Nyckel(index);
end
kryptering=double(in)+double(Fullnyckel);
ut=char(kryptering);