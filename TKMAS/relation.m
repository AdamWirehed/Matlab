function prob=relation(namn1,namn2,alg)

%%
Namn1=double(namn1);
Namn2=double(namn2);

if alg==1
    Summa=sum(Namn1)+sum(Namn2);
    prob=mod(Summa,100);
elseif alg==2
    Summa1=sum(Namn1);
    Summa2=sum(Namn2);
    if Summa1 > Summa2
        SummaK=Summa2/Summa1;
        prob=round(SummaK*100);
    elseif Summa1 < Summa2
        SummaK=Summa1/Summa2;
        prob=round(SummaK*100);
    end
elseif alg==3
    if strcmpi(namn1,'Adam');
        prob=96;
    elseif strcmpi(namn2,'Adam');
        prob=96;
    else
        Summa=sum(Namn1)+sum(Namn2);
        prob=mod(Summa,100);
    end
end
