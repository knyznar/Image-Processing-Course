close all; clearvars; clc;

image = imread('kwadraty.png');
krawedzie = edge(image,'canny');

figure();
subplot(1,2,1); imshow(image); title('oryginal');
subplot(1,2,2); imshow(krawedzie); title('detekcja canny');

%%
[H,tehta,ro] = hough(krawedzie,'RhoResolution',1,'ThetaResolution',1);

hpeaks = houghpeaks(H,8);

figure(2);
imshow(H,[]);
hold on;
plot(hpeaks(:,2),hpeaks(:,1),'o');
hold off;


lines = houghlines(krawedzie,tehta,ro,hpeaks,'FillGap',5,'MinLength',7);

%% przykładowy kod z pomocy houghlines
lines = houghlines(krawedzie,tehta,ro,hpeaks,'FillGap',5,'MinLength',7);
figure, imshow(image), hold on
max_len = 0;

for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end