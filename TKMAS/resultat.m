function ResB=resultat(Tentand)
for n=1:length(Tentand)
    Tentand(n).Summa=sum(Tentand(n).Resultat);
    if Tentand(n).Summa < 16
        Tentand(n).Betyg=U;
    elseif Tentand(n).Summa >= 16 && Tentand(n).Summa < 24
        Tentand(n).Betyg=3;
    elseif Tentand(n).Summa >= 24 && Tentand(n).Summa < 32
        Tentand(n).Betyg=4;
    elseif Tentand(n).Summa >= 32
        Tentand(n).Betyg=5;
    end
end
ResB=Tentand;