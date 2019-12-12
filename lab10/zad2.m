clearvars; close all; clc;

image = imread('ccl2.png');
image4 = bwlabel(image,4);
image8 = bwlabel(image,8);

figure();
subplot(1,3,1); imshow(image,[]); title('oryginal');
subplot(1,3,2); imshow(image4,[]); title('bwlabel 4');
subplot(1,3,3); imshow(image8,[]); title('bwlabel 8');