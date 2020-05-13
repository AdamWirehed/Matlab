clear all
clc

L=1;    % the length of the rod
n=101;  % the number of points, n-1 is the number of intervals
p=linspace(0,L,n);
t=[1:n-1; 2:n; ones(1,n-1)];
e=[1 n; 1 2];
P=11;       %N
R=0.01;
BdryData=@(x,tag)BdryDataDugga(x,tag,P);
dL=[]; hi=[];
i=1;

for h=0:0.1:10
        EqData=@(x,tag)EqDataDugga(x,tag,h);
        [U,A,b]=MyPoissonSolver(p,t,e,EqData,BdryData);
        dL=[dL;U(end)]; % save the extension in a column matrix
        
        S(i,1)=h;
        S(i,2)=U(end);
        
        i=i+1;
end
