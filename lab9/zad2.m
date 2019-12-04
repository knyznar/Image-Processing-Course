close all; clearvars; clc;

image = imread('umbrealla.png');
imshow(image);
Img_start = image;

image = double(rgb2hsv(image));
imageH = image(:,:,1);
[Y, X] = size(imageH);

%% zmienne globalne do funkcji
global prog min_size segRes MRes index;
prog = 0.05;
min_size = 8;
segRes = zeros(Y,X);
MRes = zeros(Y,X);
index = 0;

%%
figure();
split(imageH,1,1,Y,X);

i = 0;

while i < index
    IB = segRes == i;
    if sum(IB(:)) == 0 
       i = i + 1;
       continue;
    end
    [yF, xF] = find(IB,1,'first');
    IB_dilate = imdilate(IB,strel('square',3));
    IB_diff = imabsdiff(IB_dilate,IB);
    IB_mult = IB_diff.* segRes;
    IB_mult_non_zeros = nonzeros(IB_mult);
    IB_unique = unique(IB_mult_non_zeros);
    joined = 0;
    for k = 1:numel(IB_unique) %Dla każdego sąsiada
        IBS = segRes == IB_unique(k);
        [yFS, xFS] = find(IBS,1,'first');        
        colorDifference = abs(MRes(yF,xF) - MRes(yFS, xFS));
        if colorDifference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
    end
        if joined == 0
            i = i+1;
        end
end

%%przerabianie do wyświetlenia
U = unique(segRes);
for i = 1:numel(U)
    maska = segRes == U(i);
    if sum(maska) < 10
        segRes(maska) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    maska = segRes == segRes_unique_2(i);
    segRes(maska) = i;
end

Img_final = label2rgb(segRes);

subplot(1,2,1); imshow(Img_start)
subplot(1,2,2); imshow(Img_final,[]);


