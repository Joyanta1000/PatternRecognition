clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Project\new (times new roman)\1_candidate.jpg');
%ImageShow = imshow(ImageRead);

ImageR = imread('D:\Last Semester\PR\PR lab\Project\new (times new roman)\Template_1.jpg');
%ImageS = imshow(ImageR);

c = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(c);
ty = graythresh(ct);

bit = im2bw(c, t);
%b = not(bil);
imshow(bit);
bi = im2bw(ct, ty);
%bi = not(bit);
figure(), imshow(bi);

normal = normalize(ImageRead);
normal_1 = normalize(ImageR);

c = normxcorr2(bit,bi);

[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(bit,1);
xoffSet = xpeak-size(bit,2);
hFig = figure;
hAx  = axes;
imshow(bi,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(bit,2), size(bit,1)]);

% a = bit;
% b = bi
% 
% 
% m=size(a);
% n=size(b);
% a=im2double(a);
% b=im2double(b);
% a1=mean2(a);
% b1=mean2(b);
% c1=0;c2=0;
% for i=1:m
%     for j=1:n
%       c1=c1+(a(i,j)-a1);
%       c2=c2+(b(i,j)-b1);
%       num=c1*c2;
%       c3=(c1^2)*(c2^2);
%       dem=sqrt(c3);
%     end
% end
% 
% c=num/dem;
% 
% %ist way to normalize
% 
% [ypeak, xpeak] = find(c==max(c(:)));
% yoffSet = ypeak-size(a,1);
% xoffSet = xpeak-size(a,2);
% hFig = figure;
% hAx  = axes;
% imshow(b,'Parent', hAx);
% imrect(hAx, [xoffSet, yoffSet, size(a,2), size(a,1)]);

