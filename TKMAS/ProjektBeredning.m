%% Taylor

k=95;
VB1=0.25;
VB2=0.5;
Fc=[725 1073 1540];
ap=[1.5 1.5 1.5];
f=[0.15 0.3 0.5];

for i=1:length(Fc)
    Kc(i)=Fc(i)/(f(i)*ap(i));
end

A=[1 1/(f(1)*sind(k));
    1 1/(f(3)*sind(k))];

b=[Kc(1);
    Kc(3)];

x=A\b;

k1=x(1);
k2p=x(2);

k2b=k2p/VB1; k2=k2b*VB2;
k=[k1 k2];
