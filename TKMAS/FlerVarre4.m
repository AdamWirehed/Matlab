%% 1
n=101;
p=linspace(0,1,n);
t=[1:n-1; 2:n; ones(1,n-1)];
e=[1 n; 1 2];
V=sin(7*p);
plot(p,V,'.-');

hold on

q=zeros(1,n);
j=7;
for i=1:n
    if i==j
        q(i)=V(i);
    else
        continue
    end
end

plot(p,q,'.-');

%% 2
[U, A, b] = MyPoissonSolver(p, t, e, @EqData1, @BdryData1);

plot(p,U,'.-');
plot(p,-1/2*p.^2+p+1,'.-');


%% 3
    n=10;
    p=linspace(0,1,n);
    t=[1:n-1; 2:n; ones(1,n-1)];
    e=[1 n; 1 2];
    
    [U, A, b] = MyPoissonSolver(p, t, e, @EqData3, @BdryData3)
    
    plot(p,U,'.-');
    
%% 4
    n=10;
    p=linspace(0,1,n);
    t=[1:n-1; 2:n; ones(1,n-1)];
    e=[1 n; 1 2];
    
    A=1;
    [U, A, b] = MyPoissonSolver(p, t, e, @EqData4, @BdryData4);
    
    plot(p,U,'.-');
    

    