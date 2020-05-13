%i&j matris

clear A;

n=100;
tic
for i=1:n
    for j=1:n
        A(i,j)=i*j/(i+j)^2;
    end
end
tid1=toc;

clear A;

tic
A=zeros(n,n);
for i=1:n;
    for j=1:n
        A(i,j)=i*j/(i+j)^2;
    end
end
tid2=toc;

fprintf('Tiden utan fördefinierad matrisstorlek är %fs. och tiden med fördefinierad matrisstorlek är %fs. \n',tid1,tid2);

%när vi fördefinierar allokerar vi en lämplig minnesbit, så slipper datorn
%utöka matrisen varje gång den inser att matrisen är för liten