       
close all;
clear all;
clc;
    
I = imread('a.jpg');    %reading image 

I=rgb2gray(I);

[LL,LH,HL,HH]= dwt2(I,'haar');    %taking wavelet transform in built command

figure
subplot(2,2,1);
imshow(LL/255);    %output low,low pass filter
title('LL band of image');
subplot(2,2,2);
imshow(LH);         %output low,high pass filter
title('LH band of image');
subplot(2,2,3);
imshow(HL);         %output high,low pass filter
title('HL band of image');
subplot(2,2,4);
imshow(HH);         %output high,high pass filter
title('HH band of image');

imwrite(I,'C:\Users\user\Documents\MATLAB\a.jpg','CompressionRatio',100);
imwrite(I,'C:\Users\user\Documents\MATLAB\b.jpg');

figure
subplot(1,3,1)
imshow(I)
title('Original Image')

subplot(1,3,2)
imshow('C:\Users\user\Documents\MATLAB\b.jpg')
title('JPEG compressed')

subplot(1,3,3)
imshow('C:\Users\user\Documents\MATLAB')
title('JPEG 2000 compressed')

%Inverse JPEG-2000
rgb_Xrec=idwt2(LL,LH,HL,HH,'haar');
figure(3);
imshow(uint8(rgb_Xrec));
title('Recovered Image')
