%========================================================
% Uppgift 2b: Lottodragning.m
%
% Datornummer=Anonym tentamenskod:
% 
% Tentamensdatum: 2013-10-23
%
%========================================================
function rad=Lottodragning()

bollar=1:35;
rad=zeros(1,7);
for i=1:7
    index=randi(length(bollar));
    rad(i)=bollar(index);
    bollar(index)=[];
end