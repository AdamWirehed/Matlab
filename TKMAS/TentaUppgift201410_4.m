%% Step one: define the parameter space as in Linderholt's lic. thesis
K0=1;M0=1;                      %Let true parameters equal to one

K=linspace(0.8,1.2,100);        %Let K and M range from .5 to 1.5 in the
M=linspace(0.8,1.2,100);        %subsequent plots.

%% Step two: define the three cost functions studied
for a=1:length(K)
    for b=1:length(M)
        [d1(a,b),d2(a,b),d3(a,b)]=definecost(K(a),M(b),K0,M0);
    end
end
%% Step three: do contour plots of the three cases

figure(1);
contour(K,M,d1,15,'ShowText','on');xlabel('K');ylabel('M');
title('Balancing the eigenvalue equation cost function');
figure(2);
contour(K,M,d2,15,'ShowText','on');xlabel('K');ylabel('M');
title('Best Subspace Method cost function - course book version');
figure(3);
contour(K,M,d3,15,'ShowText','on');xlabel('K');ylabel('M');
title('Best Subspace Method cost function - Linderholt lic. version');
