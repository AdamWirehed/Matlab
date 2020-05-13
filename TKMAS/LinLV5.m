close all
%% 1
clear all
clc
A{1}=[1 0 0; 3 -1 0; 5 4 0];
A{2}=[5 4 -2; 4 5 2; -2 2 8];
q=1/sqrt(2);
A{3}=[q -q 0; q q 0; 0 0 0];
A{4}=[1 1 0; 0 1 0; 0 0 1];

for i=1:length(A)
    [EVek{i}, EVa{i}]=eig(A{i});
        DT{i}=inv(EVek{i})*A{i}*EVek{i};      %Fjärde matrisen ger en varning dvs, inte diagonaliserbar
end

T1=EVek{1}*EVa{1}*inv(EVek{1})-A{1};    %Inte noll = inte diagonaliserbar
T2=EVek{2}*EVa{2}*inv(EVek{2})-A{2};    %Blir noll = diagonaliserbar   Är ortogonal
T3=EVek{3}*EVa{3}*inv(EVek{3})-A{3};    %Blir noll
%% 2a)
B=1/sqrt(5)*[1;2;5];
n=B/norm(B);
S=[30 0 10;
    0 30 10;
    10 10 30];
s=S*n;
nspann=n'*s;
skjuvspann=sqrt(norm(s).^2-(nspann).^2);

%% b)
[Huvudrikt,Huvudspn]=eig(S);              %Tar ut huvudspänningsriktningar och huvudspänningen
%Egenvärdena och dess egenvektor är huvudspänningen i den riktningen

    
%% 3a)
x0 = [1; 2; -1];
% 400  equidistant  points  between (inclusive) 0 and 10:
t = linspace(0, 10, 400);
x = zeros(3, length(t));   % a 3-vector  for  each t-value
for n=1:length(A)
    for i = 1: length(t)
    x(:,i) = expm(t(i)*A{n})*x0;
    end
    figure 
    plot(t, x(1,:), t, x(2,:), t, x(3,:)) % plot x1, x2 och x3 as three curves
end

%% dia-metod
x0=[1; 2; -1];
for i=1:length(A)
[EV E]=eig(A{i});
C=EV\x0;

x=linspace(0,10,400);
f1 =C(1)*EV(1,1)*exp(E(1,1)*x)+C(2)*EV(2,1)*exp(E(2,2)*x)+C(3)*EV(3,1)*exp(E(3,3)*x);
f2 =C(1)*EV(1,2)*exp(E(1,1)*x)+C(2)*EV(2,2)*exp(E(2,2)*x)+C(3)*EV(3,2)*exp(E(3,3)*x);
f3 =C(1)*EV(1,3)*exp(E(1,1)*x)+C(2)*EV(2,3)*exp(E(2,2)*x)+C(3)*EV(3,3)*exp(E(3,3)*x);

figure 
hold on;
plot(x,f1)
plot(x,f2)
plot(x,f3)
end

%A1 ser lite olik ut
%A2 väldigt lik
%A3 följer mönstret, men x2 avviker tidigare än förväntat
%A4 x1 följer med bra, men de andra två avviker tidigt

%% 3b)
U=[0 1; -2 -2];
x0 = [1; -2];
% 400  equidistant  points  between (inclusive) 0 and 10:
t = linspace(0, 10, 400);
x = zeros(2, length(t));   % a 2-vector  for  each t-value
for i = 1: length(t)
x(:,i) = expm(t(i)*U)*x0;
end
figure
plot(t, x(1,:), t, x(2,:)) % plot x1 and x2 as two  curves