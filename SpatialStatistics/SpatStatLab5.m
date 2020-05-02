close all
clear all

%%
path = "TMS016_data/gothenburg_satellite.png"
fig = imread(path);
figV = double(reshape(fig, [818*934 3]));

fig1 = figure(1);
imagesc(fig);

K = 4;

[cFig, cParam] = normmix_kmeans(figV, K, 100, 0);

fig2 = figure(2);
imagesc(reshape(cFig, [818 934]));


%% 
gMix = normmix_sgd(figV, K);
[nor_class, nor_prob] = normmix_classify(figV, gMix);

%%
fig3 = figure(3);
imagesc(reshape(nor_class, [818 934]));

RGB = [0 1 1; 0 0 1; 1 0 0; 0.5 0 0.5; 1 0.5 0.2; 0.5 0.3 0.7];
RGB = RGB(2:K+1,:);

img_class = classification2rgb(reshape(nor_prob, 818, 934, K), RGB);
fig4 = figure(4);
imagesc(img_class);


%%
% print("Mean values k-means")
% print(cParam.mu)
% print("Mean values Gaussian Mixture model")
% print(gMix.mu)

%% Task 3

figDouble = double(fig)/255;
figStack = reshape(figDouble, [818*934 3]);

cl = nor_class;

fig5 = figure(5);
for k=1:4
    fig_class = figStack;
    fig_class(cl~=k, :) = 256;
    subplot(2,2,k)
    imagesc(reshape(fig_class, [818 934 3]));
    axis image;
end

%% Task 4

lab = rgb2lab(fig);
[labKM, labKM_par] = normmix_kmeans(reshape(lab, [818*934 3]), K, 100, 0);

fig6 = figure(6);
imagesc(reshape(labKM, [818 934]))

