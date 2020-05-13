%Fibonacci
clear all;
close all;
clc;

%Inputdel
fk=2;
fkm1=1;
fkm2=1;
s=0
%Beräkningsdel
while fkm1+fkm2<4000000
fk=fkm1+fkm2;
fkm2=fkm1;
fkm1=fk;

end

%Output-del
fk