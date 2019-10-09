clearvars; close all; clc;
parrot = imread('chessboard.bmp');

figure(1);
imshow(parrot);
xReScale = 5; 
yReScale = 5;

[YY, XX] = size(parrot);
nXX = round(XX * xReScale);
nYY= round(YY * yReScale);

nImg = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;

%i = ii*xStep;  
%ii - wspolrzedna w nowym obrazie, i - wspolrzedna w obrazie wejściowym
for ii = 0:nYY-1
    for jj = 0:nXX-1
        x = round(jj * xStep);
        y = round(ii * yStep);      
        
        if(x > XX-1)
            x = XX -1;
        end     
        if(y > YY-1)
            y = YY-1;
        end
         
        nImg(ii+1, jj+1) = parrot(y +1 , x + 1);
    end
end

figure(2);
imshow(nImg);