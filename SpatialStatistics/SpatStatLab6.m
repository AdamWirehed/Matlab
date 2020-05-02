close all
clear all

%%
fig = imread("rice.png");
fig = double(fig)/255;

fig1 = figure(1);
imagesc(fig);

%%

f_ave = [1 1 1; 1 1 1; 1 1 1];
f_hor = [1 1 1; 0 0 0; -1 -1 -1];
f_ver = f_hor';

fig_ave = conv2(fig, f_ave);
fig_hor = conv2(fig, f_hor);
fig_ver = conv2(fig, f_ver);

% Prewitt image
% Prewitt operator is used for edge detection in an image. 
% It detects two types of edges
% Horizontal and vertical edges
for i = 1:length(fig(:,1))
    for j = 1:length(fig(1,:))
        v(i,j) = fig_ver(i,j);
        u(i,j) = fig_hor(i,j);
    end
end
fig_Prewitt = sqrt(v.^2+u.^2);

fig2 = figure(2);
subplot(2,2,1)
imagesc(fig_ave)
subplot(2,2,2)
imagesc(fig_hor)
subplot(2,2,3)
imagesc(fig_ver)
subplot(2,2,4)
imagesc(fig_Prewitt)

%% 

K = 2;
figV = fig(:);

gMix = normmix_sgd(figV, K);
[nor_class, nor_prob] = normmix_classify(figV, gMix);

fig_bin = reshape(nor_class, [256 256]);
circular = strel('disk', 5);


% Erode: The basic effect of the operator on a binary image is to 
% erode away the boundaries of regions of foreground pixels
%  Thus areas of foreground pixels shrink in size, 
% and holes within those areas become larger.
fig_erode = imerode(fig_bin, circular);

% The dilation operation usually uses a structuring element for 
% probing and expanding the shapes contained in the input image.
fig_dilate = imdilate(fig_bin, circular);

% opening is the dilation of the erosion of a set A by a 
% structuring element B:
fig_open = imopen(fig_bin, circular);

fig3 = figure(3);
subplot(2,2,1)
imagesc(fig_bin)
colormap gray

subplot(2,2,2)
imagesc(fig_erode)

subplot(2,2,3)
imagesc(fig_dilate)

subplot(2,2,4)
imagesc(fig_open)


%% 

r = [1 2 3 5];

fig4 = figure(4);
colormap gray
for i = 1:4
    circ = strel('disk',r(i));
    I_open = imopen(I,circ);
    subplot(2,2,i)
    imagesc(I_open)
end
