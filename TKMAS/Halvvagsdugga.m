%Halvvägsdugga

%Inputdel
ksum=0;
N=4000000
n=1
f(1)=1;
f(2)=2;
f(3)=3;
f(4)=5;
f(5)=8;
%Beräkningsdel
while k<N
    n=n+2
    k=f(n+1)+f(n)

    ksum=ksum+k;
end

A=ksum+2;
A
    