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

fprintf('Tiden utan f�rdefinierad matrisstorlek �r %fs. och tiden med f�rdefinierad matrisstorlek �r %fs. \n',tid1,tid2);

%n�r vi f�rdefinierar allokerar vi en l�mplig minnesbit, s� slipper datorn
%ut�ka matrisen varje g�ng den inser att matrisen �r f�r liten