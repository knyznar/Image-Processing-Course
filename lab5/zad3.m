clearvars; close all; clc;

moon = imread("moon.bmp");

M = [0 1 0; 1 -4 1; 0 1 0];     % maska laplasjanu
M = M/9;

moon_lap = uint8(conv2(moon, M, 'same'));

%% 
figure();
subplot(2, 2, 1);
imshow((moon_lap + 128), []); title("filter adding 128");
subplot(2, 2, 2);
imshow(abs(moon_lap), []); title("filter with abs()");
subplot(2, 2, 3);
imshow(moon + moon_lap + 128,[]); title('moon with 128');
subplot(2, 2, 4);
imshow(moon + abs(moon_lap),[]); title('moon with abs');

%%
laplacianFilter = fspecial('laplacian');
lmask = uint8(conv2(moon, laplacianFilter, 'same'));

figure;
subplot(3,2,1);
imshow(lmask + 128,[]); title('laplacian + 128');

subplot(3,2,2);
imshow(abs(lmask),[]); title('laplacian with abs()');

subplot(3,2,3);
imshow(moon + lmask + 128,[]); title('moon with 128');

subplot(3,2,4);
imshow(moon + abs(lmask),[]); title('moon with abs');

subplot(3,2,5);
imshow(imabsdiff(moon, moon + lmask + 128),[]); title("różnica oryginału i filtracji 128");

subplot(3,2,6);
imshow(imabsdiff(moon, moon + abs(lmask)),[]); title("różnica oryginału i filtracji abs");