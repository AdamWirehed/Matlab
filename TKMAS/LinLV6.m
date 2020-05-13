clear all
clc

%% 1
sigmac=1;

sigma=[49.1 75.6 105.1 130.5 150.4];
ep=[1.4e-8 8.7e-8 1.7e-6 3.4e-5 2.3e-3]';
B=ep;
for n=1:length(sigma)
    A(n,:)=[log(sigma(n)/sigmac) -1];
end
test=rref([A log(B)]);

a=A'*A;
b=A'*log(B);        %Löser ekv. A'Ax=A'b

x=a\b;
x2=rref([a b]); %Överflödigt i matlab
n=x(1);
t=exp(x(2));

plot(sigma,ep,'r');

f1=@(x) 1/t*abs(x/sigmac).^n;
hold on
fplot(f1,[49 150]);

figure
hold on
f2=@(x) n*log(x/sigmac)-log(t);
fplot(f2,[49 150]);
plot(sigma,log(ep),'r');
