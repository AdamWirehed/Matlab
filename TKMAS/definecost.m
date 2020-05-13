function [d1,d2,d3]=definecost(K,M,K0,M0)
% definecost: Function which defines three slightly different formulations
% of cost functions for a 1D parametric model calibration problem in
% structural dynamics where the parameters are the mass and stiffness of
% the associated system.
% 
% input: K - stiffness value 
%        M - mass value
%        K0- true stiffness value
%        M0- true mass value
%
% output: d1 - The Balancing the eigenvalue equation cost function
%         d2 - The Best Subspace Method cost function (version 1)
%         d3 - The Best Subspace Method cost function (version 2)
%
% call: [d1,d2,d3]=definecost(K,M,K0,M0)



d1(a,b)=(K(a)-(K0/M0)*M(b)).^2; %Balancing the eigenvalue eq. err.
d2(a,b)=(2-(M0*K(a))/(K0*M(b))-M(b).^2/(M0.^2)).^2;%Best subspace 1
d3(a,b)=(1-(M0*K(a))/(K0*M(b))).^2+(1-M(b)/M0).^2; %Best subspace 2
end