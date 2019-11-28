close all; clearvars; clc;

image = imread('dom.png');
krawedzie = edge(image,'log');
krawedzieRecznie = edge(image,'log',25,0.1);

figure();
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(krawedzie); title('detekcja LoG');
subplot(1,3,3); imshow(krawedzieRecznie); title('LoG z recznymi parametrami');

%%
tresh = [0.1 0.3];
sigma = 0.07;
krawedzie = edge(image,'Canny');
krawedzieRecznie = edge(image,'canny',tresh,sigma);

figure();
subplot(1,3,1); imshow(image);              title('oryginal');
subplot(1,3,2); imshow(krawedzie);          title('detekcja Canny');
subplot(1,3,3); imshow(krawedzieRecznie);   title('Canny z recznymi parametrami');

%%
tresh = 0.1;
sobel = edge(image,'Sobel');
sobelRecznie = edge(image,'Sobel',tresh);

figure();
subplot(1,3,1); imshow(image);              title('oryginal');
subplot(1,3,2); imshow(sobel);          title('detekcja Sobel');
subplot(1,3,3); imshow(sobelRecznie);   title('Sobel z recznymi parametrami');