clear all
clc
close all

it=1000;

for i=1:it
    x=randi(1000,1,4);
    tic
    sortnumbers(x);
    Tid1E{i}=toc;
end

for i=1:it
    y=randi(1000,1,1000);
    tic
    sortnumbers(y);
    Tid2E{i}=toc;
end


for i=1:it
    x=randi(1000,1,4);
    tic
    sort(x);
    Tid1M{i}=toc;
end

for i=1:it
    y=randi(1000,1,1000);
    tic
    sort(y);
    Tid2M{i}=toc;
end

figure;
subplot(2,1,1);
hold on
for i=1:length(Tid1M)
    plot(i,Tid1E{i},'pk');
    plot(i,Tid1M{i},'pr');
end
ylabel('Tid [s]');
title('Sort med en 1x4 lista','fontsize',12);
legend('Hemmabyggd sort-funktion','Matlabs sort-funktion','location','best');

subplot(2,1,2);
hold on
for i=1:length(Tid1M)
    plot(i,Tid2E{i},'pk');
    plot(i,Tid2M{i},'pr');
end
xlabel('Iterationer');
ylabel('Tid [s]');
title('Sort med en 1x1000 lista','Fontsize',12);


    
