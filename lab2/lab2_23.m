clearvars; close all; clc;

chess = imread('chessboard.bmp');
chess1 = imresize(chess,[300,300], 'nearest');
figure;
imshow(chess1);
chess2 = imresize(chess,[300,300], 'bilinear');
figure;
imshow(chess2);
chess3 = imresize(chess,[300,300], 'bicubic');
figure;
imshow(chess3);

lena = imread('lena.bmp');
lena1 = imresize(lena,[300,300], 'nearest');
figure;
imshow(lena1);
lena2 = imresize(lena,[300,300], 'bilinear');
figure;
imshow(lena2);
lena3 = imresize(lena,[300,300], 'bicubic');
figure;
imshow(lena3);

parrot = imread('parrot.bmp');
parrot1 = imresize(parrot,[300,300], 'nearest');
figure;
imshow(parrot1);
parrot2 = imresize(parrot,[300,300], 'bilinear');
figure;
imshow(parrot2);
parrot3 = imresize(parrot,[300,300], 'bicubic');
figure;
imshow(parrot3);