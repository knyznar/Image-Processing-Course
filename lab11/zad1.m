clearvars; close all; clc;

%image = imread('dwieFale.bmp');
%image = imread('kolo.bmp');
%image = imread('kwadrat.bmp');
%image = imread('kwadrat45.bmp');
image = imread('trojkat.bmp');

fImage = fft2(image);
ffshiftImage = fftshift(fImage);

figure(1);
subplot(1,3,1); imshow(image); title("oryginal");
subplot(1,3,2); imshow(fImage); title("fft2");
subplot(1,3,3); imshow(ffshiftImage); title("fftshift");

ampl = log10(abs(ffshiftImage) + 1);
phaze = angle(ffshiftImage.*(ampl>0.0001));

figure(2);
subplot(1,3,1); imshow(image); title("oryginal");
subplot(1,3,2); imshow(ampl,[]); title("amplituda");
subplot(1,3,3); imshow(phaze,[]); title("faza");

iffImage = ifftshift(ffshiftImage);
ifImage = ifft2(iffImage);

figure(3);
subplot(1,2,1); imshow(image); title("oryginal");
subplot(1,2,2); imshow(ifImage,[]); title("ifImage");
