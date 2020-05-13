clear all
clc

Pask=load('Datum.txt');
Ar=Pask(:,1);
Manad=Pask(:,2);
Datum=Pask(:,3);

Mars=[];
April=[];
for n=1:length(Pask)
    if Manad(n)==1
        Mars=[Mars Datum(n)];
    elseif Manad(n)==2
        April=[April Datum(n)];
    end
end

M=zeros(1,10);
A=zeros(1,25);
for n=1:length(Mars)
    for d=1:10
        if Mars(n)==(d+21)
            M(d)=M(d)+1;
        end
    end
    for d=1:25
        if April(n)==d
            A(d)=A(d)+1;
        end
    end
end
DatumB=[22:31 1:25];
x=1:35;
bar(x,[M A]);
axis tight
xlabel('Mars                                               April');
ylabel('Antal dagar');
set(gca,'xticklabel',DatumB);


    