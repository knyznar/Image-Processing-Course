clearvars; close all; clc;

rice = imread("katalog.bmp");
%rice = imread("rice.png");
figure();
subplot(1, 2, 1);
imshow(rice);
subplot(1, 2, 2);
imhist(rice);
%%
riceBW = rice;
[X, Y] = size(rice);

size = 16;
W2 = size/2;
level = 123;

for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,rice,X,Y);
        if(rice(i,j)<m)
            riceBW(i,j) = 0;
        else
            riceBW(i,j) = 255;
        end
    end
end
 
figure;
subplot(1,2,1);
imshow(rice);
title('Oryginal');
 
subplot(1,2,2);
imshow(riceBW);
title('Binaryzacja lokalna');
 %%
R=128;
k=0.15;
riceBW = rice;
 
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,rice,X,Y);
        s = stddevLT(i,j,W2,rice,m,X,Y);
        T = m*(1+k*(s/R-1));
        if(rice(i,j)<T)
            riceBW(i,j) = 0;
        else
            riceBW(i,j) = 255;
        end
    end
end
 
figure;
subplot(1,2,1);
imshow(rice);
title('Oryginal');

subplot(1,2,2);
imshow(riceBW);
title('Binearyzacja Sauvoli');