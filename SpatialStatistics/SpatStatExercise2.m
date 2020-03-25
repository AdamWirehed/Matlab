close all

%%
h = linspace(0, 10, 1e3);
% h, sigma, kappa, nu
% h - Distance
% sigma^2 - Variance
% kappa - decides the practical correlation length r
% r = sqrt(8*nu)/kappa
% nu - smoothness parameter

r1 = matern_covariance(h, 1, 1, 1/2);
r2 = matern_covariance(h, 1, 1, 3/2);
r3 = matern_covariance(h, 1, 1, 5/2);
fig1 = figure(1);
plot(h, r1)
hold on
plot(h, r2)
plot(h, r3)
legend("\nu = 1/2", "\nu = 3/2", "\nu = 5/2")


a1 = matern_covariance(h, 1/2, 1, 1);
a2 = matern_covariance(h, 1, 1, 1);
a3 = matern_covariance(h, 3/2, 1, 1);
fig2 = figure(2);
plot(h, a1)
hold on
plot(h, a2)
plot(h, a3)
legend("\sigma = 1/2", "\sigma = 1", "\sigma = 3/2")


b1 = matern_covariance(h, 1, 1/2, 1);
b2 = matern_covariance(h, 1, 1, 1);
b3 = matern_covariance(h, 1, 3/2, 1);
fig3 = figure(3);
plot(h, b1)
hold on
plot(h, b2)
plot(h, b3)
legend("\kappa = 1/2", "\kappa = 1", "\kappa = 3/2")

gauss = gaussian_covariance(h, 1, 1);
matern = matern_covariance(h, 1, 2, 3/5);
fig4 = figure(4);
plot(h, gauss)
hold on
plot(h, matern)
legend("Gaussian", "Matern: \sigma = 1, \kappa = 2, \nu = 3/5")

%%

S = meshgrid()

