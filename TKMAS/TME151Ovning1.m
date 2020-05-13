f=@(x) sin(x);
I=[0 pi/2];
n1=10;
n2=100;

for s=1:3
    Type=s;
    Svarn1{s}=riemann(f,I,n1,Type);
    Svarn2{s}=riemann(f,I,n2,Type);
    diff{s}=abs(Svarn1{s}-Svarn2{s});
end

fprintf('Differansen mellan användandet av 10 respektive 100 intervall i Riemann summor med \n metod 1 = %0.4f (Vänstra punkten) \n metod 2 = %0.4f (Mittpunkten) \n metod 3 = %0.4f (Högra punkten) \n',diff{1},diff{2},diff{3});
