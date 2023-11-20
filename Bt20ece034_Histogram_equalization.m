
% Generate histogram and perform histogram equalization
clc;
clear;
close all;

% read the image

I=imread('hello.png');
I=rgb2gray(I);
[b c]=size(I);
I=double(I);

histo1=zeros(1,256);
for i=1:b
    for j=1:c
        for k=0:255
            if I(i,j)==k
                histo1(k+1)=histo1(k+1)+1;
            end
        end
    end
end

%generating pdf out of histogram by dividing total no of pixels
pdf=(1/(b*c))*histo1;

%generating cdf out of pdf
cdf(1)=pdf(1);

for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end

cdf=round(255*cdf);
ep=zeros(b);
for i=1:b
    for j=1:c
        t=(I(i,j)+1);
        ep(i,j)=cdf(t);
    end
end
histo2=zeros(1,256);
for i=1:b
    for j=1:c
        for k=0:255
            if ep(i,j)==k
                histo2(k+1)=histo2(k+1)+1;
            end
        end
    end
end


subplot(2,2,1);
imshow(uint8(I));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
plot(histo1);
subplot(2,2,4);
plot(histo2); 
