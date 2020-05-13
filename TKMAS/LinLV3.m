%% 1
n=4;
H=hilb(n);
CH=cond(H);
CHma=norm(H)*norm(inv(H));
Diff=abs(CH-CHma);

%% 2
for n=1:10
H=hilb(n);
CH(n)=cond(H);
end

semilogy(CH);

%% 3
n=4;
H=hilb(n);
b=randi(10,n,1);
S=rref([H,b]);
x1=S(:,n+1);
x2=invhilb(n)*b;

%% 4
n=10;  
H=hilb(n);
b=randn(n,1);

M1=rref([H,b]); Rad=M1(:,n+1)
M2=H\b; Back=M2
M3=inv(H)*b; Langsam=M3
M4=invhilb(n)*b; Exakt=M4

Exakt==Rad
Exakt==Back
Exakt==Langsam


%% 5

%Se feluskatthilb

%% 6
close all
s=5;
for n=2:s
    [Kmax,Kmin]=feluskatthilb(n,100000);
    KMa(n-1)=Kmax;
    KMi(n-1)=Kmin;
end
X=[2:5];
semilogy(X,KMa)
hold on
semilogy(X,KMi)

%% 7

%1. Ju st�rre storleken �r hilb-matrisernna vi ber�kar, desto st�rrre blir felet. Och att
%min kod �r fel
%2. Noggranheten i v�rt svar/ber�kning
%3. Eftersom felet i ber�kningen med denna kod blir st�rre om storleken p�
%H �kar. D�rf�r m�ste vi g�ra fler ber�kningar f�r att f� ett relevant
%resultat


