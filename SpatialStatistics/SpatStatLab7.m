close all
clear all

%%

K = 2;
alpha = 0;
beta = 1;
N = [0 1 0; 1 0 1; 0 1 0];
nsim = 300;
m = 100;
n = 100;
z0 = zeros(m,n,K);
z0(:,:,1) = 1;
plotflag = 1;

[z,Mz,ll]=mrf_sim(z0,N,alpha,beta,nsim,plotflag);
