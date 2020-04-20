close all
clear all

%% 2

m = 50;

kappa = 0.1;
q = kappa^2*[0 0 0;0 1 0;0 0 0] + [0 -1 0; -1 4 -1;0 -1 0];
Q = stencil2prec([m,m],q);

v = zeros(m^2, 1);
ind = m^2/2;
v(ind) = 1;
c = Q\v;

fig1 = figure(1);
imagesc(reshape(c, [m m]));

R = chol(Q);
x = R\randn(m^2, 1);

fig2 = figure(2);
imagesc(reshape(x, [m m]));

Q2 = Q*Q;
v = zeros(m^2, 1);
ind = m^2/2;
v(ind) = 1;
c = Q2\v;

fig3 = figure(3);
imagesc(reshape(c, [m m]));

%% 3

N = round(m/3);

ind = randperm(m^2);
ind_obs = ind(1:N);
ind_mis = ind(N+1:end);
x_obs = x(ind_obs);
x_mis = x(ind_mis);

Qop = Q(ind_obs, ind_mis);
Qo = Q(ind_obs);
Qp = Q(ind_mis);

