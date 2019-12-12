clearvars; close all; clc;

obraz = imread('shapes.png');
srcImage = obraz;

labeled = bwlabel(obraz,4);
figure();
subplot(1,2,1); imshow(srcImage,[]); title('oryginal');
subplot(1,2,2); imshow(labeled,[]); title('po indeksacji');

figure;
imshow(labeled);
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

wsp = obliczWspolczynniki(labeled);
[Y,X] = size(labeled);
%%
for J = 1:Y
    for I = 1:X
        piksel = labeled(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66)
            labeled(J,I) = 0;
        end
    end
end

figure();
subplot(1,2,1); imshow(srcImage,[]); title('dane');
subplot(1,2,2); imshow(labeled,[]); title('krzyzyki');

%%
shapesReal = imread('shapesReal.png');

imageSrc = shapesReal;

IBW = im2bw(shapesReal,0.22);
IC = imcomplement(IBW);
element_str = strel('rectangle',[5 5]);
Ierode = imerode(IC,element_str);

shapesEroded = Ierode;
imageBW = bwlabel(shapesEroded,4);

wsp = obliczWspolczynniki(imageBW);
[YY,XX] = size(imageBW);

for J = 1:YY
    for I = 1:XX
        piksel = imageBW(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.50 && wsp(piksel,2) < 0.66)
            imageBW(J,I) = 0;
        end
    end
end

figure();
subplot(1,3,1); imshow(imageSrc,[]); title('shapesReal.png');
subplot(1,3,2); imshow(shapesEroded); title('postac binarna');
subplot(1,3,3); imshow(imageBW,[]); title('krzyzyki');