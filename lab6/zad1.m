clearvars; close all; clc;

load('MR_data.mat');

%%
img0 = I_noisefree;
img1 = I_noisy1;
img2 = I_noisy2;
img3 = I_noisy3;
img4 = I_noisy4;

rysuj(img0, 0.1);
rysuj(img0, 0.7);

rysuj(img1, 2);
rysuj(img1, 12);

rysuj(img2, 4);
rysuj(img2, 14);

rysuj(img3, 0.1);
rysuj(img3, 5);

rysuj(img4, 0.2);
rysuj(img4, 2);

%%
function rysuj(image, sigma)
    figure();
    subplot(1,3,1);
    imshow (image,[]);
    title('oryginał');
    subplot(1,3,2);
    conv = convolution(image,[5 5]);
    imshow(conv,[]);
    title('convoution');
    subplot(1,3,3);
    bil = bilateral(image,[5 5], sigma);
    imshow(bil,[]);
    title('bilateral');
end
