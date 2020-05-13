Styvhet=load('styvhet.txt');

P=[3;3];
Au=[];
for n=1:length(Styvhet)
    k1{n}=Styvhet(n,1);
    k2{n}=Styvhet(n,2);
    k{n}=[k1{n}+k2{n} -k2{n};-k2{n} k2{n}];
    u{n}=sum(ekvLosning(k{n},P))/2;
    if u{n}>0.6
        Au=[Au u{n}];
    end
end
AuS=sort(Au,'descend');
for n=1:length(AuS)
    fprintf('Styvhetspar nr %d gav förskjutningen %0.3f m \n',n,AuS(n));
end

    