clear all
close all


%%
x = imread("TMS016_data/chalmersplatsen.jpg");
[m,n,d] = size(x);

x = double(x)/255;

imagesc(x);
colormap('gray')
axis image;

fig2 = figure(2);
imshow(x(:,:,1));
axis image;
set(fig2, 'Position', [500 500 700 500]);

%%

y1 = mean(x, 3);
y2 = double(rgb2gray(x));
d = imabsdiff(y1, y2);

fig3 = figure(3);
imshow(y1);
set(fig3, 'Position', [500 500 700 500]);
axis image;

fig4 = figure(4);
imshow(y2);
set(fig4, 'Position', [500 500 700 500]);
axis image;

fig5 = figure(5);
imshow(d);
set(fig5, 'Position', [500 500 700 500]);
axis image;

hist = figure(6);
imhist(y2);


%%

A = [156 85 32; 93 234 56; 67 34 12];
M = repmat(A, [5 5 3]);
M = double(M)/255;
fig7 = figure(7);
imagesc(M);

lab = rgb2lab(x);

fig8 = figure(8);
imshow(lab(:,:,1));
set(fig8, 'Position', [500 500 700 500]);

fig9 = figure(9);
imshow(lab(:,:,2));
set(fig9, 'Position', [500 500 700 500]);

fig10 = figure(10);
imshow(lab(:,:,3));
set(fig10, 'Position', [500 500 700 500]);

s = size(lab);
z = zeros([s(1) s(2) 4]);
z(:,:,1) = lab(:,:,2) > 0.4;
z(:,:,2) = lab(:,:,2) < 0.4 & lab(:,:,1) < 0.3;
z(:,:,3) = lab(:,:,2) < 0.4 & lab(:,:,1) > 0.3 & lab(:,:,3) < 0.3;
z(:,:,4) = lab(:,:,2) < 0.4 & lab(:,:,1) > 0.3 & lab(:,:,3) > 0.3;

RGB = [1 0 0; 0 1 0; 0 0 1; 0 0 0];

I = classification2rgb(z, RGB);

fig11 = figure(11);
imagesc(I);

