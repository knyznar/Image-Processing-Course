clearvars; close all; clc;

image = imread('ferrari.bmp');

SE = strel('square',3);

imageEroded = imerode(image,SE);
imageDilatated = imdilate(image,SE);
diff = imabsdiff(imageEroded,imageDilatated);
imageOpened = imopen(image,SE);
imageClosed = imclose(image,SE);
imageTopHat = imtophat(image,SE);
imageBottomHat = imbothat(image,SE);

figure();
subplot(2,2,1); imshow(image);              title('oryginał');
subplot(2,2,2); imshow(imageEroded);        title('erozja');
subplot(2,2,3); imshow(imageDilatated);     title('dylatacja');
subplot(2,2,4); imshow(diff);               title('diff');

%%
figure();
subplot(2,2,1); imshow(image);              title('oryginał');
subplot(2,2,2); imshow(imageOpened);        title('otwarcie');
subplot(2,2,3); imshow(imageClosed);        title('zamknięcie');

%%
figure();
subplot(2,2,1); imshow(image);              title('oryginał');
subplot(2,2,2); imshow(imageTopHat);        title('topHat');
subplot(2,2,3); imshow(imageBottomHat);     title('bottomHat');

%%
image = imread('rice.png');

SE = strel('disk',10);
imagetophat = imtophat(image,SE);

figure();
subplot(1,2,1); imshow(image);             title('oryginal');
subplot(1,2,2); imshow(imagetophat);       title('tophat');