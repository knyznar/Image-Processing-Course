clearvars; close all; clc;

image = imread('fingerprint.bmp');

image2 = bwmorph(image,'thin');
image3 = bwmorph(image2,'thin');
imageInf = bwmorph(image,'thin',Inf);

figure();
subplot(2,2,1); imshow(image);      title('oryginał');
subplot(2,2,2); imshow(image2);     title('1x bwmorph thin');
subplot(2,2,3); imshow(image3);     title('2x bwmorph thin');
subplot(2,2,4); imshow(imageInf);   title('Inf bwmorph thin');

%% Szkieletyzacja
image = imread('kosc.bmp');
imageInf = bwmorph(image,'skel',Inf);

figure();
subplot(1,2,1); imshow(image);     title('oryginał');
subplot(1,2,2); imshow(imageInf);  title('Inf bwmorph skel');

%% Rekonstrukcja morfologiczna
image = imread('text.bmp');

SE = ones(51,1);

image2 = imopen(image,SE);
image3 = imreconstruct(imerode(image,SE),image);

figure();
subplot(3,1,1); imshow(image);     title('oryginał');
subplot(3,1,2); imshow(image2);    title('imopen');
subplot(3,1,3); imshow(image3);    title('imreconstruct');

%% Wypełnianie dziur
image = imread('text.bmp');

figure();
subplot(2,1,1); imshow(image);                    title('oryginał');
subplot(2,1,2); imshow(imfill(image,'holes'));    title('imfill holes');
%% Brzeg
image = imread('text.bmp');

figure();
subplot(2,1,1); imshow(image);                    title('oryginał');
subplot(2,1,2); imshow(imclearborder(image));    title('imclearborder');