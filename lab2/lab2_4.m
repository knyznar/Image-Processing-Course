clearvars; close all; clc;

obraz = imread('lena.bmp');
lena = imresize(obraz,[128,128]);

im1 = imadjust(lena,[],[0,31/255]);
im2 = imadjust(lena,[],[0,15/255]);
im3 = imadjust(lena,[],[0,7/255]);
im4 = imadjust(lena,[],[0,3/255]);
im5= imadjust(lena,[],[0,1/255]); %binaryzacja

subplot(3,2,1)
imshow(im1,[])

subplot(3,2,2)
imshow(im2,[])

subplot(3,2,3)
imshow(im3,[])

subplot(3,2,4)
imshow(im4,[])

subplot(3,2,5)
imshow(im5,[])