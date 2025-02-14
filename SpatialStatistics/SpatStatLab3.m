close all
clear all

%% Parameters
n = 50;
N = 500;
sLine = linspace(0, 1, n);
beta1 = 1;
beta2 = 0.5;

%% 2
[X, Y] = meshgrid(sLine, sLine);

ind = randperm(n*n);
ind_o = ind(1:N);
loc = [X(:), Y(:)];

D = squareform(pdist(loc));

Z = chol(matern_covariance(D, 1, 1, 0.5))'*randn(n*n,1);
xFunc = (1*beta1 + X(:)*beta2 + Z)';
yResp = zeros(1, n*n);

yResp(:) = xFunc + randn(1, n*n);

fig1 = figure(1);
imagesc(reshape(xFunc, [50 50]));
hold on
scatter(xFunc, yResp, 100, 'f', 'r');

%% 3

beta = mldivide([ones(N, 1), xFunc(ind_o)'], yResp(ind_o)');
xObs = xFunc(ind_o);
yObs = yResp(ind_o);

yHat = [ones(N, 1), xObs']*beta;
r = yObs' - yHat;

Dobs = squareform(pdist([X(ind_o)', Y(ind_o)']));
out = emp_variogram(Dobs, r, N);
true = matern_variogram(D, 1, 1, 0.5, 1);


