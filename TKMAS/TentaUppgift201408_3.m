%% a)
load('sifodata.mat');
i=1;

roster=[sifo(1).roster;sifo(2).roster;sifo(3).roster];
felma=[sifo(1).felmarginal;sifo(2).felmarginal;sifo(3).felmarginal];
hold on
for n=1:length(sifo(1).roster)
    h(n)=plot(1:3,roster(:,n));
end