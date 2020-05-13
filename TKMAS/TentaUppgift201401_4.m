clear all
clc

%% a)
Fornamn{1,1}='Adam'; Fornamn{2,1}='Matthias';
Efternamn{2,1}='Wirehed'; Efternamn{1,1}='Ydström';
Personnummer{1,1}=970930;   Personnummer{2,1}=970922;
Resultat{1,1}=[8 2 2 5 2]; Resultat{2,1}=[8 6 4 5 4];

Tentand=struct('Fornamn',Fornamn,'Efternamn',Efternamn,'Personnummer',Personnummer,'Resultat',Resultat);

%% b)
SorteradTentand=sortera(Tentand);

%% c)
ResultatOBetyg=resultat(SorteradTentand);

%% d)
For='Förnamn';
Ef='Efternamn';
B='Betyg';

fprintf('%s \t %s \t %s \n',For,Ef,B);
for n=1:length(ResultatOBetyg)
    fprintf('%s  \t %s \t %02i \n',SorteradTentand(n).Fornamn,SorteradTentand(n).Efternamn,ResultatOBetyg(n).Betyg);
end