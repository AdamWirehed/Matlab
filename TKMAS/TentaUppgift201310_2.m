clear all
clc

%% a)
Antal=nchoosek(35,7);

%% b)
%skrev function längst upp och flytta index till början av loopen

%% c)
n=0;
MinRad=Lottodragning;
Vinst=Lottodragning;
Antalratt=0;
tic;
    
while Antalratt<5
        Antalratt=0;
        MinRad=Lottodragning;
        Vinst=Lottodragning;
        n=n+1;
        for m=1:length(MinRad)
            for v=1:length(MinRad)
                if MinRad(1,m)==Vinst(1,v)
                    Antalratt=Antalratt+1;
                end
            end
        end
end
TidVinst=toc;
n