%Kod:

A=[1 3 4;1 -2 1;1 -3 -2];
B=[7;0;-15];

%Naiv l�sning
%x=inv(A)*B;
%disp(x)

%B�ttre l�sning
x=A\B;
disp(x)