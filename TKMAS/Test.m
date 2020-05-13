%Fibonacci

%Inputdel
fk=2;
fkm1=1;
fkm2=1;

%Beräkningsdel
while fkm1+fkm2<20000
fk=fkm1+fkm2;
fkm2=fkm1;
fkm1=fk;
end

%Output-del
fk