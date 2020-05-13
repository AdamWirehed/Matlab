%% a)
A=[9 5 2;
    3 0 4;
    1 8 2];
b=[];
for a=1:length(A)
    b=[b A(a,:)];
end
      
%% b)
c=sort(b,'ascend');

%% c)
d=zeros(1,2*length(c)+1);
for n=0:(length(c)-1);
    d(2.*n+1)=c(n+1);
end

%% d)
E=[2 1 1;
    -1 1 2;
    3 1 2];
e=[1;2;3];

x=E\e
    
