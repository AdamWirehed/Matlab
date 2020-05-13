function [x,U]=TME151Ovning2Facit(f,I,ua,h)
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
%           computes an approximation of cos(x). 
%           plot(x,U) plots the solution. 
% 

%----------------------------------------------------------------------
%
%   Date created: 2000-11-01, 
%          
%   Author:  Stig Larsson
%
%   Change history:  2002-10-24 changed u to U 
%                    2006-11-13 changed to function handle
%
%------------------------------+---------------------------------------+

a=I(1);
b=I(2);

i=1;
x(1)=a;
U(1)=ua;

while x(i)<b
  i=i+1;
  x(i)=x(i-1)+h; 
  xi=x(i-1);                  % left-hand method
%  xi=x(i-1)+h/2;              % mid-point method
  U(i)=U(i-1)+h*f(xi);
end

x=x';
U=U';
