%Fibonacci summan av j�mna tal
clear all;
close all;
clc;

%Inputdel
fk=2;
fkm1=1;
fkm2=1;
s=0;
%Ber�kningsdel
while fkm1+fkm2<4000000
fk=fkm1+fkm2;
fkm2=fkm1;
fkm1=fk;
f2=fkm1+fkm2;
fkm2=fkm1;
fkm1=f2;
f2=fkm1+fkm2;
fkm2=fkm1;
fkm1=f2;

s=s+fk;
end

%Output-del
fk
s