function [t,U]=TMV151ODE(f,int,ua,h)
% myode -  solves initial value problem for general system of 
%          ordinary differential equations u'=f(t,u) 
%   Syntax: 
%           [t,U]=myode(f,int,ua,h)
%   Arguments: 
%           f   - function handle pointing to a function file  
%           int - 1x2 matrix specifying a time interval int=[a,b]
%           ua  - dx1 matrix specifying an initial value
%           h   - positive number, the stepsize
%   Returns: 
%           t - nx1 matrix containg the time points with t(1)=a
%           U - nxd matrix containing the approximate solution
%   Description:
%           The program computes an approximate solution of the intial 
%           value problem  u'=f(t,u), a<t<b; u(a)=ua.  Here u, f, 
%           and ua are column vectors of dimension d.  The file f.m 
%           must contain the function f(t,u) with syntax uprime=f(t,u). 
%           The program returns the nx1 matrix t of time points with 
%           t(1)=a and the nxd matrix U with row number i containing 
%           the transposed solution vector at time t(i).  
%           The program uses the Euler forward method. 
%   Examples: 
%          [t,U]=myode(@funk3, [0, 20], [1; 0],.01);
%   See also:
%          crash.m, ode23.m, ode45.m, ode15s.m 
%           

%----------------------------------------------------------------------
%   Bugs:
%
%   Date created: 
%          
%   Author:
%          
%
%   Change history:
%
%------------------------------+---------------------------------------+
% Write your program here! 
% Hint:
% first let U be a dxn matrix
% U(:,i) denotes column i of the matrix U 
% compute these columns by the euler forward method,
% finally, transpose U so that it becomes a nxd matrix, 
% transpose t also. 

a=int(1); %Första punkten i intervallet
b=int(2); %Sista punkten i intervallet

i=1;
t(1)=a;
U(:,1)=ua;

while t(i) < b
    i=i+1;
    t(i)=t(i-1)+h;
    U(:,i)=U(:,i-1)+h*f(t(i-1),U(:,i-1));
end

plot(t,U);







