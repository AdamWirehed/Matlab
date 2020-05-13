function [astr]=getstr(str,midind,lchar,rchar)

Ls=midind;
while str(Ls)~=lchar
    Ls=Ls-1;
end

Rs=midind;
while str(Rs)~=rchar
    Rs=Rs+1;
end
astr=str(Ls+1:Rs-1);
end