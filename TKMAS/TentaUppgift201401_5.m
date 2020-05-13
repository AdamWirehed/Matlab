%========================================================
% Uppgift 5
%
% Datornummer:
% 
% Anonym tentamenskod:
% 
% Tentamensdatum: 2014-01-15
%
%========================================================
% Programbeskrivning:
% Nedanst�ende program ....
% 
%
%
%========================================================
clear variables

%% a&b)
X0=[0.1,0.1,0.1]';              %Startv�rde
f=@(t,X)Lorenz(X);              %Funktionshandtag
for a=1:2
    if a==1
    [t,X]=ode45(f,[0 100],X0);      %Tidsstegsl�sning
    elseif a==2
        X0=X0.*0.00001;
        [t2,X2]=ode45(f,[0 100],X0);
    end
end
%Tidsstegsl�saren ode45 ger en output s� att t �r tiden
%med de intervall som l�sningen beskrivs med, X(:,1) �r
%l�sningen f�r den f�rsta variabeln och X(:,n) f�r den
%n:te.

figure;
subplot(3,1,1);
hold on
plot(t,X(:,1));
plot(t2,X2(:,1));
ylabel('x1');

subplot(3,1,2);
hold on
plot(t,X(:,2));
plot(t2,X2(:,2));
ylabel('x2');

subplot(3,1,3);
hold on
plot(t,X(:,3));
plot(t2,X2(:,3));
ylabel('x3');
xlabel('t');
legend('X0','X0*1e-4','location','best');

%% c)
figure;
plot3(X(:,1),X(:,2),X(:,3));


