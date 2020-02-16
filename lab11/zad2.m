clearvars; close all; clc;

image = imread('lena.bmp');
fImage = fft2(image);
ffImage = fftshift(fImage);
ampl = log10(abs(ffImage) + 1);
phaze = angle(ffImage.*(ampl>0.0001));

figure(1)
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(ampl,[]); title('amplituda');
subplot(1,3,3); imshow(phaze,[]); title('faza');

%%
[f1,f2] = freqspace(512,'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;

figure(2);
colormap(jet(64)); mesh(f1,f2,Hd);

imageFiltr = ffImage.*Hd;
figure(3);
imshow(imageFiltr);

nImage = ifft2(ifftshift(imageFiltr));

figure(4);
imshow(nImage,[]);
%%

h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h,512,512);

figure(5);
mesh(f1,f2,H);

imageFiltr2 = ffImage.*H;
figure(6);
imshow(imageFiltr2);

nnImage = ifft2(ifftshift(imageFiltr2));

figure(7);
imshow(nnImage,[]);

%% Gauss
[w, h] = size(image);
mask = fspecial('gaussian', h, 30);
graymask = mat2gray(mask);
filtrimg = ffImage.*graymask;

figure();
imshow(filtrimg);

nImg = uint8(ifft2(ifftshift(filtrimg)));

figure();
imshow(nImg);
