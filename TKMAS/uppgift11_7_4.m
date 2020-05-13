clear all
clc

r=1; %Radie klot
Pp=700; %Densitet plastklot (700 kg/m3)
Pv=1000; %Densitet vatten (1000 kg/m3)
g=9.81; %tyngdaccelerationen (m/s2)
mk=((4.*pi.*r.^3)/3).*Pp; %massa klot
Fk=mk.*g; %Tyngdkraft klot
Fkx=[Fk,Fk];
Fky=[0,2];
%Vuv=pi.*x.*(x-x.^2./3); %Volym under vatten (klot)
Fv=@(x) Pv.*g.*pi.*x.*(x-x.^2./3); %Kraft som verkar p� klotet
x=linspace(0,2,20); %intervallet i plot
plot(Fky,Fkx,'k'); %Drar en linje mellan punkterna Fky och Fkx
hold on
fplot(Fv,[0,2]); %Plottar funktionen Fv i intervallet 0 till 2
h=@(x) (Fv(x)-Fk); %D� h==0 s� �r Fv==Fk
xsol=fzero(h,0.5) %Plockar ut x-v�rdet f�r sk�rningspunkten
plot(xsol,Fv(xsol),'xb'); %S�tter ut ett bl�tt x i sk�rningspunkten

