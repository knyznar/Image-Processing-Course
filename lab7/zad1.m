clearvars; close all; clc;

image = imread('ertka.bmp');

buzka = imread('buzka.bmp');
wyspa = imread('wyspa.bmp');
kolka = imread('kolka.bmp');
hom = imread('hom.bmp');

SEsquare3 = strel('square',3);
SEdiamond3 = strel('diamond',3);
SEoctagon3 = strel('octagon', 3);

erod1 = imerode(image, SEsquare3);
erod2 = imerode(erod1, SEsquare3);
erod3 = imerode(erod2, SEsquare3);

subplot(2,2,1); imshow(image); title("original");
subplot(2,2,2); imshow(erod1); title("erozja");
subplot(2,2,3); imshow(erod2); title("erozja x2");
subplot(2,2,4); imshow(erod3); title("erozja x3");

%% usuwanie wlosow
%SE2 = strel('arbitrary',[0 1; 1 0]);
SE2 = strel('arbitrary',[1 0; 0 1]);
buzkaEroded = imerode(buzka,SE2);

figure();
subplot(1,2,1); imshow(buzka); title('oryginał');
subplot(1,2,2); imshow(buzkaEroded); title('erozja');

%% Rozne przeksztalcenia
image = imread('ertka.bmp');
%image = wyspa;
%image = kolka;

SE = strel('square', 3);
%SE = strel('diamond',3); 
%SE = strel('octagon', 3);

figure();
subplot(2,3,1); imshow(image);                  title('oryginał');
subplot(2,3,2); imshow(imerode(image,SE));      title('erozja');
subplot(2,3,3); imshow(imdilate(image,SE));     title('dylatacja');
subplot(2,3,4); imshow(imopen(image,SE));       title('otwarcie');
subplot(2,3,5); imshow(imclose(image,SE));      title('zamknięcie');

%% ertka bez dziur
image = imread('ertka.bmp');

SE = strel('square',3);
image = imopen(image,SE);
image = imclose(image,SE);

figure(5);
imshow(image);

%% HitMiss
image = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

figure(6);
subplot(1,2,1); imshow(image);                           title('oryginał');
subplot(1,2,2); imshow(bwhitmiss(image,SE1,SE2));        title('trafi, nie trafi');