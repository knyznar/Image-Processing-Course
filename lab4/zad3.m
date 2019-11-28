clearvars; close all; clc;

bart = imread("bart.bmp");
figure();
subplot(1, 2, 1);
imshow(bart);
subplot(1, 2, 2);
imhist(bart);


obrazBW = bart > 195 & bart < 210;
figure;
imshow(obrazBW);