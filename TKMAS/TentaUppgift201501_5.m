clear all
close all
clc

%% a)
%se snofall.m

%% b)
D=1;
T=[];
M=[];
Mp=[];
while sum(T)<=0.9&&sum(M)<=1.3
    [T(D),M(D)]=snofall(D);
    T=[T T(D)];
    M=[M M(D)];
    D=D+1;
    if D>90
        fprintf('Grattis! Du slapp skotta i år! \n');
        break
    end
end
Mp=[];
Tp=[];
for n=2:D
    M(n)=M(n-1)+M(n);
    Mp=[Mp M(n)];
    T(n)=T(n-1)+T(n);
    Tp=[Tp T(n)];
end
figure;
subplot(2,1,1);
hold on
plot(1:D-1,Mp);
ylabel('[kN/m^2]');

subplot(2,1,2);
hold on
plot(1:D-1,Tp);
ylabel('[m]');
xlabel('Antal dagar från den 1 Dec');


