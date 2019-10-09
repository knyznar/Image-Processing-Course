clearvars; close all; clc;

obraz = imread('lena.bmp');
lena256 = imresize(obraz,[256,256]);
lena128 = imresize(obraz,[128,128]);
lena64 = imresize(obraz,[64,64]);

figure;
imshow(obraz)
figure;
imshow(lena256, 'InitialMagnification', 200)
figure;
imshow(lena128,'InitialMagnification', 400)
figure;
imshow(lena64,'InitialMagnification', 800)
