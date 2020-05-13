function extra2_1(x)
z=load(x);
V=cell(length(z));
A=cell(length(z));
p=cell(length(z));
for i=1:length(z)
V{i}=z(1,i); %Tilldelar V{i} volymen för alla 4 koner
A{i}=z(2,i); %Tilldelar A{i} arean för alla 4 koner
p{i}=z(3,i); %Tilldelar p{i} densiteten för alla 4 koner
end

h=cell(length(z));
m=cell(length(z));

for i=1:length(z)
    h{i}=(3.*V{i})/A{i}; %Räknar ut höjden på konerna och lägger svaren i cellmatrisen h
    m{i}=p{i}*V{i};      %Räknar ut massan på konerna och lägger svaren i cellmatrisen m
end
hm=cell2mat(h); %Gör om cellmatrisen h till en matris
mm=cell2mat(m); %Gör om cellmatrisen h till en matris

K=cell(length(z));

for f=1:length(z)
    K{f}=sprintf('Kon%02i',f); %Kon1, Kon2....
end

Hojd=bar(hm,'BarWidth',0.5);               %Stapeldiagram med Höjden
ylabel('Höjd [m]');
set(gca,'xticklabel',K);   %Sätter ut Kon1,Kon2...
figure                      %Plottar i nytt fönster
Massa=bar(mm,'BarWidth',0.5);
ylabel('Massa [kg]');
set(gca,'xticklabel',K);   %Sätter ut Kon1,Kon2...

