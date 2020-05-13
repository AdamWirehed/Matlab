%% 1
A=zeros(6,8);
A(1,1:8)=2:2:16;
A(2,1:8)=-1:1:6;
A(3,4)=1;
A(3,5)=3;
A(4,3)=1;
A(4,6)=7;
A(5,2)=1;
A(6,1)=1;
A(6,end)=2;

%% 2a
format rational

A=[3 1 1 2; 0 5 2 1; 0 0 5 3; 4 6 0 4];
b=[6;9;-2;20];

xm1=[A,b];
Sx1=rref(xm1);

if Sx1(1:4,1:4)==eye(4,4)
    fprintf('\nx1=%d \nx2=%d \nx3=%d \nx4=%d \n',Sx1(1,5),Sx1(2,5),Sx1(3,5),Sx1(4,5));
else 
    fprintf('Parameterlösning');
end

 
%% 2b

B=[3 7 -4 1/2; 0 5 2 1; 0 0 5 3; 4 6 0 4];
c=[1/2;1;3;4];

xm2=[B,c];
Sx2=rref(xm2);

format 

if Sx2(1:4,1:4)==eye(size(B))
    fprintf('\nx1=%d \nx2=%d \nx3=%d \nx4=%d \n',Sx2(1,5),Sx2(2,5),Sx2(3,5),Sx2(4,5));
    
else
    B(4,1:4)=[0 0 0 1];
    c(4,1)=randi(10,1);
    xm3=[B,c];
    Sx3=rref(xm3);

    if Sx3(1:4,1:4)==eye(size(B))
        fprintf('\nx1=%d \nx2=%d \nx3=%d \nx4=%d \n',Sx3(1,5),Sx3(2,5),Sx3(3,5),Sx3(4,5));
    else 
        error('Kolla en gång till idiot');
    end
end

