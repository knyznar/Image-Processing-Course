clearvars; close all; clc;

lena_szum = imread("lenaSzum.bmp");
img_med = uint8(medfilt2(lena_szum));
lena = imread("lena.bmp");

%%
figure();
subplot(1, 3, 1);
imshow(lena_szum);
subplot(1, 3, 2);
imshow(img_med);
subplot(1, 3, 3);
imshow(imabsdiff(lena_szum, img_med),[]);

%%
lena_avg = uint8(conv2(lena, fspecial('average'), 'same'));

figure();
subplot(2, 3, 1);
imshow(lena); title("Oryginał");
subplot(2, 3, 2);
imshow(lena_avg); title("filtr uśredniający");
subplot(2, 3, 3);
imshow(imabsdiff(lena, lena_avg),[]); title("moduł z różnicy");

lena_med = uint8(medfilt2(lena));

subplot(2, 3, 4);
imshow(lena); title("Oryginał");
subplot(2, 3, 5);
imshow(lena_med); title("filtr medianowy");
subplot(2, 3, 6);
imshow(imabsdiff(lena, lena_med),[]); title("moduł z różnicy");

%%
lena_10med = lena;
for i= 0:10
    lena_10med = medfilt2(lena_10med, [5 5]);
end

%% 
figure();
subplot(1, 3, 1);
imshow(lena);
subplot(1, 3, 2);
imshow(lena_10med);
subplot(1, 3, 3);
imshow(imabsdiff(lena, lena_10med),[]);

