close all
clear all

%% Parameters
n = 50;
N = 500;
sLine = linspace(0, n, n);
beta1 = 1;
beta2 = 0.5;

%% 2
[X, Y] = meshgrid(sLine);

Z = @(s) matern_covariance(s, 1, 1, 1);
xFunc = @(s) 1.*beta1 + s.*beta2 + Z(s);
yResp = zeros(1, N);

ind = randperm(n*n);
ind_o = ind(1:N);
loc_o = X(ind_o);
sigma = 0.5;

yResp(:) = xFunc(loc_o) + sigma;

fig1 = figure(1);
imagesc([0 max(xFunc(loc_o))], [0 max(yResp)], xFunc(loc_o));
hold on
scatter(xFunc(loc_o), yResp, 100, 'f', 'r');

%% 3

mu = mean(yResp);
e = yResp - mu;
pFit = polyfit(xFunc(loc_o), yResp, 1);

D = xFunc(loc_o) - yResp;
binEst = emp_variogram(D, sLine, N);







