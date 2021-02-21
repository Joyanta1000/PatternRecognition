clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\1_candidate.jpg');
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
figure, surf(c), shading flat;
