clc
clear all
close all

Img1=imread('mountain.jpeg');
figure,imshow(Img1),title('Original')
[Height, Width, Depth]=size(Img1);

 if Depth==1
     Img2=Img1
 else
     Img2=Img1(:,:,:);
 end

M=4;
Img3=Img2(1:M:Height,1:M:Width,1:Depth);
% figure,imshow(Img3),title('No prefiltering')
Img4=imresize(Img3,[Height,Width],'bicubic');
% figure,imshow(Img4),title('Downsample, no prefiltering')

% APPLYING GAUSSIAN FILTERING

Img5=imfilter(Img2,fspecial('gaussian',[4,4],1),'symmetric','replicate','conv');
Img6=Img5(1:M:Height,1:M:Width,1:Depth);
% figure, imshow(Img6),title('After prefiltering')
Img7=imresize(Img6,[Height,Width],'bicubic');
% figure, imshow(Img7),title('After prefiltering-Upscaled')

% USING LANCZOS FILTERING


Img8=imresize(Img3,1,'lanczos3');
% figure, imshow(Img8),title('After LANCZOS-Upscaled')

% RESAMPLING AFTER LANCZOS USING SPLINE

nimg = imresample([4,4],Im2double(Img8),[1,1],'spline');
figure, imshow(nimg),title('After LANCZOS-Upscaled-Spline')

% RESAMPLING USING BICIBIC


Img9=imresize(Img8,[Height,Width],'bicubic');
figure, imshow(Img9),title('After lanczos-bicubic-Upscaled')
 
 











