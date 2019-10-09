%I(i,j) = ai+bj+cij+d
clearvars; close all; clc;
obraz = imread('chessboard.bmp');

figure(1);
imshow(obraz);
xReScale = 5; 
yReScale = 5;

[YY, XX] = size(obraz);
nXX = round(XX * xReScale);
nYY= round(YY * yReScale);

nImg = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;
 
%ii - wspolrzedna w nowym obrazie, i - wspolrzedna w obrazie wejściowym
for ii = 0:nYY-1
    for jj = 0:nXX-1
        x1 = floor(jj * xStep);
        y1 = floor(ii * yStep);     
        y2 = y1 +1;
        x2 = x1 +1;
        
        xn = rem(ii,1);
        yn  = rem(jj,1);
        if(x2 > XX-1)
            x2 = XX -1;
        end
        
        if(y2 > YY-1)
            y2 = YY-1;
        end

         
        fa = double(obraz(y1+1,x1+1));
        fb = double(obraz(y1+1,x2+1));
        fc = double(obraz(y2+1,x2+1));
        fd = double(obraz(y2+1,x1+1));
         
        nImg(ii+1, jj+1) = [1-xn xn] *[fa fd; fb fc]* [1-yn; yn];
    end
end

figure(2);
imshow(uint8(nImg));
