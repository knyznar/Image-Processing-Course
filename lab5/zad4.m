clearvars; close all; clc;

load('maskiPP.mat');
image = imread('jet.bmp');

%% detekcja krawedzi - gradient Robertsa
conv = uint8(conv2(image, R1, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');
%%
conv = uint8(conv2(image, R2, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');
%%
conv = uint8(conv2(image, P1, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');
%%
conv = uint8(conv2(image, P2, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');
%%
conv = uint8(conv2(image, S1, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');
%%
conv = uint8(conv2(image, S2, 'same'));

figure;
subplot(2,2,1);
imshow(conv + 128,[]); title('laplacian with added 128');
subplot(2,2,2);
imshow(abs(conv),[]); title('laplacian filter treated with abs()');
subplot(2,2,3);
imshow(image + conv + 128,[]); title('image with 128');
subplot(2,2,4);
imshow(image + abs(conv),[]); title('image with abs');

%% filtry kombinowane
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);
OW2 = abs((conv2(image, S1, 'same')).^2) + abs((conv2(image, S2, 'same')).^2);

figure;
imshow(OW, []);

figure;
imshow(OW2, []);


