function Vut=mod10(Vin)
Summa=0;
Siffersumma=[];
for n=1:length(Vin)
    if mod(n,2)~=0
    Vin(n).*2;
    Siffersumma(n)=sum(int2str(Vin(n))-48);
    
    elseif mod(n,2)==0
        Siffersumma(n)=sum(Vin(n));
    end
    Summa=sum(Siffersumma);
    Summa/10
   
end