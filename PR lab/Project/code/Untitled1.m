clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Project\numbers (times new roman) templates\1_candidate.jpg');

ImageR = imread('D:\Last Semester\PR\PR lab\Project\numbers (times new roman) templates\Template_1.jpg');

cit = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(cit);
ty = graythresh(ct);

bic = im2bw(cit, t);

imshow(bic);

bit = im2bw(ct, ty);

figure(), imshow(bit);

N=length(bic);

xf=bit;
win_num=size(xf,2);
M0=size(bic,2);

cc=NaN(M0-1,win_num);
for col=1:win_num
    for m=1:M0-1,
        [step1,step2,step3]=deal(0);
        for n=1:N-m,
            step1=step1+xf(n,col)*xf(n+m,col);
            step2=step2+xf(n,col)^2;
            step3=step3+xf(n+m,col)^2;
        end
        cc(m,col)=step1/sqrt(step2*step3);        
    end
end

co = cc;

N_1=length(bic);

xf_1=bic;
win_num_1=size(xf_1,2);
M0_1=size(bic,2);

cc_1=NaN(M0_1-1,win_num_1);
for col=1:win_num_1
    for m=1:M0_1-1,
        [step1,step2,step3]=deal(0);
        for n=1:N_1-m,
            step1=step1+xf_1(n,col)*xf_1(n+m,col);
            step2=step2+xf_1(n,col)^2;
            step3=step3+xf_1(n+m,col)^2;
        end
        cc_1(m,col)=step1/sqrt(step2*step3);        
    end
end

co_1 = cc_1;

c = normxcorr2(co_1,co);

[ypeak, xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(bic,1);
xoffSet = xpeak-size(bic,2);
hFig = figure;
hAx  = axes;
imshow(bit,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(bic,2), size(bic,1)]);