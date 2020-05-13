%% a)
Bild=load('wikipediabild.mat');

%% b)
image(Bild.myPic);
axis image; axis off; %läs i hjälpen för axis

%% c)
pic2=255-myPic;     %Skapa ettor med ones: 255*ones(size(Bild.myPic))-myPic
figure;
image(pic2);
axis image; axis off

%% d)
pic3=[Bild.myPic pic2];
figure;
image(pic3);
axis image; axis off
imwrite(pic3,'kittens.jpg')
