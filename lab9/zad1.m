close all; clearvars; clc;

figure(1);
image = imread('knee.png');
imshow(image);
selected = floor(ginput(1));
tmp = selected(1);
selected(1) = selected(2);
selected(2) = tmp;
%% Inicjalizacja
image = double(image);

[Y, X] = size(image);

visited = zeros(Y,X);
segmented = zeros(Y,X);
stack = zeros(10000,2);
iStack = 1;

stack(1,:) = selected;
visited(selected(1), selected(2)) = 1;
segmented(selected(1), selected(2)) = 1;

while iStack > 0
   nY = stack(iStack,1);  
   nX = stack(iStack,2);
   iStack = iStack - 1;
   
   if((nY-1 >= 1) && (nY+1 <= Y) && (nX-1 >= 1) && (nX+1 <= X))
       for J = nY-1:nY+1
           for I = nX-1:nX+1
               diff = abs(image(nY,nX) - image(J,I));
               if (diff < 5) && (visited(J,I) == 0)
                    iStack = iStack+1;
                    stack(iStack,:) = [J,I];
                    segmented(J,I) = 1;
               end
               visited(J,I) = 1;
           end
       end
   end
end
    
%%
figure(2);
imshow(uint8(segmented),[]);

%%
image = double(image);

[Y, X] = size(image);

visited = zeros(Y,X);
segmented = zeros(Y,X);
stack = zeros(10000,2);
iStack = 1;
mV = 0;
nS = 0;

stack(1,:) = selected;
visited(selected(1), selected(2)) = 1;
segmented(selected(1), selected(2)) = 1;

%%
while iStack > 0
   nY = stack(iStack,1);
   nX = stack(iStack,2);
   iStack = iStack - 1;
   nS = nS+1;
   mV = (mV*(nS-1) + image(nY,nX))/nS;
   if((nY-1 >= 1) && (nY+1 <= Y) && (nX-1 >= 1) && (nX+1 <= X))
       for J = nY-1:nY+1
           for I = nX-1:nX+1
               length = abs(mV - image(J,I));
               if (length < 20) && (visited(J,I) == 0)
                    iStack = iStack+1;
                    stack(iStack,:) = [J,I];
                    segmented(J,I) = 1;
               end
               visited(J,I) = 1;
           end
       end
   end
end
figure(3);
imshow(uint8(segmented),[]);

%%
figure(4);
gauss = fspecial('gaussian');
segmented = imfilter(uint8(segmented),gauss);
imshow(segmented, []);