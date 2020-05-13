%% 1a)
A=randi(10,2,3);
B=randi(10,2,3);
C=randi(10,3,3);
D=eye(1,3);
F=ones(3,1);
G=randi(10,3,1);

%% b)
AB=A+B;
mA=-A;
TvaA=2*A;
treAfemB=3*A-5*B;
AC=A+C;

%% c)
AC=A*C;
AG=A*G;
AB=A*B;

%% d)
DG=D*G;
GD=G*D;

DG
GD

%% e)

Ckvadrat=C.^2;
Cu10=C.^10;

Ckvadrat
Cu10


%% 2a)
Atrans=A';

%% b)
A=[A;G'];

%% c)
InvA=inv(A);

%% d)
Check=A*inv(A);

%% e)
AIT=inv(A')
ATI=(inv(A))'


%% 3

A=[3 1 1 2; 0 5 2 1; 0 0 5 3; 4 6 0 4];
b=[6;9;-2;20];
Smash=[A,b];

Ref=rref(Smash)
Backslash=A\b
Inv=inv(A)*b

%% 4
V=1/sqrt(2);
R=[1 1 1 2 2 3 4 4 5 5 5 6 6 6 7 8 8 9 9 9 10 10 10 10 11 12 12 13 13 13 14 14 14 15 15 16 16];
K=[14 2 1 15 1 3 6 2 4 5 1 1 3 5 7 8 4 7 5 9 10 9 5 6 11 13 10 9 11 12 12 9 8 16 12 13 12];
V=[1 1 V 1 V 1 1 -1 1 V -V -V -1 -V 1 1 -1 1 V V 1 V -V -1 1 1 -1 -V -1 -V V -V -1 1 V -1 -V];
Balkar=full(sparse(R,K,V,16,16));
Krafter=zeros(16,1);
Krafter(3,1)=8;
Krafter(9,1)=10;
Krafter(11,1)=12;
Matris=[Balkar Krafter];
Svar=rref(Matris);





