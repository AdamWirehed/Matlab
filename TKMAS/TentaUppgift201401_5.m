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
% Nedanstående program ....
% 
%
%
%========================================================
clear variables

%% a&b)
X0=[0.1,0.1,0.1]';              %Startvärde
f=@(t,X)Lorenz(X);              %Funktionshandtag
for a=1:2
    if a==1
    [t,X]=ode45(f,[0 100],X0);      %Tidsstegslösning
    elseif a==2
        X0=X0.*0.00001;
        [t2,X2]=ode45(f,[0 100],X0);
    end
end
%Tidsstegslösaren ode45 ger en output så att t är tiden
%med de intervall som lösningen beskrivs med, X(:,1) är
%lösningen för den första variabeln och X(:,n) för den
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


