%Kod:

A=[1 3 4;1 -2 1;1 -3 -2];
B=[7;0;-15];

%Naiv lösning
%x=inv(A)*B;
%disp(x)

%Bättre lösning
x=A\B;
disp(x)