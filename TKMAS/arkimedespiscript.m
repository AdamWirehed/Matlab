clear all
close all
clc

A=1;
N=6;
E=1;
tol=10e-5
%Beräkningsdel
while E>tol
    N=2.*N;
    A=(2-(4-A.^2).^(1./2)).^(1./2);
    L=N.*A./2;
    U=L./(1-A.^2./2).^(1/2);
    P=(U+L)./2;
    E=(U-L)./2;
    
end
  
y=P