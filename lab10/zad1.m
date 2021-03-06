clearvars; close all; clc;

image = imread('ccl1.png');

[YY,XX] = size(image);  % YY-wiersze(wysokosc), XX-kolumny(szerokosc)
L = 1;
imgZeros = zeros(YY,XX);

%Indeksy [1..100] do dalszej cześci zadania
id = zeros(100);
for I = 1:100
    id(I) = I;
end


for J = 2:YY
    for I = 2:XX-1
        if(image(J,I) ~= 0)
            sasiedzi = [imgZeros(J-1,I-1),imgZeros(J-1,I),imgZeros(J-1,I+1),imgZeros(J,I-1)];

            if sum(sasiedzi) == 0 
                imgZeros(J,I) = L;
                L = L+1;
            else
                sasiedzi1 = nonzeros(sasiedzi);
                minimum = min(sasiedzi1);
                maximum = max(sasiedzi1);

                if(minimum == maximum)
                    imgZeros(J,I) = maximum;
                else
                    id = union(minimum,maximum,id);
                    imgZeros(J,I) = minimum;
                end
            end 
        end
     end
end

ccl1Result = imread('ccl1Result.png');
figure(1);
subplot(3,1,1); imshow(image); title('ccl1');
subplot(3,1,2); imshow(label2rgb(imgZeros),[]); title('result');
subplot(3,1,3); imshow(ccl1Result); title('ccl1Result.png');

%%
%Laczenie indeksow
lut = zeros(100);
for I = 1:100
   lut(I) = root(id(I),id); 
end

nImage2 = zeros(YY, XX);

for J = 1:YY
    for I = 1:XX
        if imgZeros(J,I) ~= 0
           nImage2(J,I) = lut(imgZeros(J,I)); 
        end
    end
end

figure();
imshow(label2rgb(nImage2),[]); title('result LUT');



function root_indeks = root(indeks,tablica)
    root_indeks = indeks;
    while tablica(root_indeks) ~= root_indeks
        root_indeks = tablica(root_indeks);
    end
end


function nTablica = union(indeksP,indeksQ,tablica)
    nTablica = tablica;
    nTablica(root(indeksP,tablica)) = root(indeksQ,tablica);
end