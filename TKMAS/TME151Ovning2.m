function [x,U]=TME151Ovning2(f,I,ua,h)
% myprim - solves the initial value problem u'(x)=f(x), u(a)=ua
%  
%   Syntax: 
%           [x,U]=myprim(f,I,ua,h)
%   Arguments: 
%           f   - function handle pointing to the name of a function file,  
%                 for example, f=@funk
%           I   - 1x2 matrix, specifying an interval I=[a b]
%           ua  - real number, the  initial value
%           h   - positive number, the stepsize
%   Returns: 
%           x -  a vector, the set of nodes x(i)
%           U -  a vector, U(i) is the approximate solution at 
%                the point x(i)
%   Description:
%           The program computes an approximate solution of the initial 
%           value problem  u'(x)=f(x), a<x<b; u(a)=ua, according to  
%           the algorithm Euler's method. 
%           The function, whose name is contained in f, must return
%           the function values y=f(x).  For example, if  f=@funk,
%           then the file funk.m must begin with "function y=funk(x)".
%           The program uses constant stepsize h.  
%   Examples: 
%           [x,U]=myprim(@cos, [0, pi/2], 0, 1e-3) 
%           computes an approximation of sin(x). 
%           plot(x,U) plots the solution. 
% 

%----------------------------------------------------------------------
%   Bugs:
%
%   Date created: 
%          
%   Author:  
%
%   Change history:
%
%------------------------------+---------------------------------------+

%Write your program here! 
G=questdlg('Vill du använda vänsterpunktsmetoden, eller mittpunktsmetoden?','Metod','Vänster','Mittpunkt','Vänster');
switch G
    case 'Vänster'
        M=1;
    case 'Mittpunkt'
        M=2;
end

i=1;
x(i)=I(1);
U(1)=ua;

while x(i)<I(2) 
    i=i+1;
    x(i)=x(i-1)+h;
    if M==1;
         xi=x(i-1);
    elseif M==2;
        xi=x(i-1)+h*1/2;
    end
    U(i)=U(i-1)+h*f(xi);
end
