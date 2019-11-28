clearvars; close all; clc;

coins = imread("coins.png");
figure();
subplot(1, 2, 1);
imshow(coins);
subplot(1, 2, 2);
imhist(coins);
%%
coinsbw = im2bw(coins, 80/255);
figure();
imshow(coinsbw);
%%
figura = imread("figura.png");
figure();
subplot(1, 2, 1);
imshow(figura);
subplot(1, 2, 2);
imhist(figura);
%%
figura2 = imread("figura2.png");
figure();
subplot(1, 2, 1);
imshow(figura2);
subplot(1, 2, 2);
imhist(figura2);
%%
figura3 = imread("figura3.png");
figure();
subplot(1, 2, 1);
imshow(figura3);
subplot(1, 2, 2);
imhist(figura3);
%%
figura4 = imread("figura4.png");
figure();
subplot(1, 2, 1);
imshow(figura4);
subplot(1, 2, 2);
imhist(figura4);
%%
coinsgray = im2bw(coins, graythresh(coins));
coinsKittler = im2bw(coins, clusterKittler(coins)/255);
coinsYen = im2bw(coins, entropyYen(coins)/255);
%%
rysuj(coins, 80);
%%
rysuj(imread("rice.png"), 130);
rysuj(imread("tekst.bmp"), 140);
rysuj(imread("obiekty.bmp"), 155);
rysuj(imread("katalog.bmp"), 80);