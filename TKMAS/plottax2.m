%Plottax2

X=[0.3 1.0 2.2 3.1 3.9];
Y=[0.1 0.9 3.8 9.4 15.8];

plot(X,Y, 'k.:')
x=linspace(0,4,100);
y=x.^2;
hold on; %Betyder "rita i samma fönster
plot(x,y)
legend('observerat','beräknat')
xlabel('x')
ylabel('y')
title('Min plot')
