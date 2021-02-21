clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\3_candidate.jpg');
%ImageShow = imshow(ImageRead);

ImageR = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\Template_1.jpg');
%ImageS = imshow(ImageR);

c = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(c);
ty = graythresh(ct);

bil = im2bw(c, t);
b = not(bil);
imshow(b);
bit = im2bw(ct, ty);
bi = not(bit);
figure(), imshow(bi);
c = normxcorr2(b,bi);
figure, surf(c), shading flat
[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(b,1);
xoffSet = xpeak-size(b,2);
hFig = figure;
hAx  = axes;
imshow(bi,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(b,2), size(b,1)]);
