close all; clearvars; clc;

img = imread("plansza.bmp");

%% Filtr uśredniający
img_avg = uint8(conv2(img, fspecial('average'), 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(img_avg);
subplot(1, 3, 3);
imshow(imabsdiff(img, img_avg),[]);

%% Filtracja uśredniająca dla różnych rozmiarów maski
figure();
subplot(2, 3, 1);
imshow(img);
subplot(2, 3, 2);
imshow(uint8(conv2(img, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img, fspecial('average', 35), 'same')));

%% Filtracja dolnoprzepustowa - Lena
img2 = imread("lena.bmp");
figure();
subplot(2, 3, 1);
imshow(img2);
subplot(2, 3, 2);
imshow(uint8(conv2(img2, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img2, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img2, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img2, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img2, fspecial('average', 35), 'same')));

%% Niwelowanie niekorzystnego efektu filtracji (utraty ostrości) przez dobór maski
M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

img_mask = uint8(conv2(img, M, 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(img_mask);
subplot(1, 3, 3);
imshow(imabsdiff(img, img_mask),[]);

%%
gaussian03 = fspecial('gaussian', 5, 0.3);
gaussian05 = fspecial('gaussian', 5, 0.5);
gaussian07 = fspecial('gaussian', 5, 0.7);
gaussian1 = fspecial('gaussian', 5, 1);

figure();
subplot(1, 4, 1)
mesh(gaussian03);
subplot(1, 4, 2)
mesh(gaussian05);
subplot(1, 4, 3)
mesh(gaussian07);
subplot(1, 4, 4)
mesh(gaussian1);

%% filtracja gaussian
figure();
subplot(2, 3, 1);
imshow(img);
subplot(2, 3, 2);
imshow(uint8(conv2(img, gaussian03, 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img, gaussian05, 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img, gaussian07, 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img, gaussian1, 'same')));
