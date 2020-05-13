function SorteradTentand=sortera(Tentand)
[~,ind]=sortrows([{Tentand.Efternamn}',{Tentand.Fornamn}']);
SorteradTentand=Tentand(ind);