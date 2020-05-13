M=5;
K=@(t) exp(t/5)+0.3.*sin(2*pi.*t); %Fondkursen
O=@(t)M.*t;
If=@(t)M./K(t); %Funktionen som ska integreras
I=@(t)integral(If,0,t);
V=@(t)K(t)*I(t);

t=[0 2]; %Intervallet

figure
subplot(2,1,1); %Första grafen
fplot(K,t);
title('Fondkursen');

subplot(2,1,2);
fplot(O,t);
hold on
fplot(V,t);
