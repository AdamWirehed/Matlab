clear all
clear workspace
clc

f_a=@(x) x.^2-2;
x0=1;
tol=1e-6;

x_a=Newtons(f_a,x0,tol);
x_a