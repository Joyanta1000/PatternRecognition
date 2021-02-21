clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\6_candidate.jpg');
%ImageShow = imshow(ImageRead);

ImageR = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\Template_1.jpg');
%ImageS = imshow(ImageR);

cit = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(cit);
ty = graythresh(ct);

bil = im2bw(cit, t);
% b = not(bil);
imshow(bil);
bit = im2bw(ct, ty);
% bi = not(bit);
figure(), imshow(bit);
c = normxcorr2(bil,bit);


%figure, surf(c), shading flat

[ypeak, xpeak] = find(c==max(c(:)));

%checking sizes
tr = size(bil,1);
tr_1 = size(bil,2);
%checking sizes

yoffSet = ypeak-size(bil,1);
xoffSet = xpeak-size(bil,2);
hFig = figure;
hAx  = axes;
imshow(bit,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(bil,2), size(bil,1)]);
