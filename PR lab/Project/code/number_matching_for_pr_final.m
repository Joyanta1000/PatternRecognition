clc();
clear all;
close all;

ImageReading_of_candidate = imread('D:\Last Semester\PR\PR lab\Project\numbers (times new roman) templates\1_candidate.jpg');

ImageReading_of_template = imread('D:\Last Semester\PR\PR lab\Project\numbers (times new roman) templates\Template_1.jpg');

rgb_to_gray_c = rgb2gray(ImageReading_of_candidate);
rgb_to_gray_t = rgb2gray(ImageReading_of_template);

threshold_value_c = graythresh(rgb_to_gray_c);
threshold_value_t = graythresh(rgb_to_gray_t);

image_to_binary_c = im2bw(rgb_to_gray_c, threshold_value_c);

imshow(image_to_binary_c);

image_to_binary_t = im2bw(rgb_to_gray_t, threshold_value_t);

figure(), imshow(image_to_binary_t);

N=length(image_to_binary_c);

xf=image_to_binary_t;
win_num=size(xf,2);
M0=size(image_to_binary_c,2);

normalization_of_template=NaN(M0-1,win_num);
for col=1:win_num
    for m=1:M0-1,
        [step1,step2,step3]=deal(0);
        for n=1:N-m,
            step1=step1+xf(n,col)*xf(n+m,col);
            step2=step2+xf(n,col)^2;
            step3=step3+xf(n+m,col)^2;
        end
        normalization_of_template(m,col)=step1/sqrt(step2*step3);        
    end
end

nt = normalization_of_template;

N_1=length(image_to_binary_c);

xf_1=image_to_binary_c;
win_num_1=size(xf_1,2);
M0_1=size(image_to_binary_c,2);

normalization_of_candidate=NaN(M0_1-1,win_num_1);
for col=1:win_num_1
    for m=1:M0_1-1,
        [step1,step2,step3]=deal(0);
        for n=1:N_1-m,
            step1=step1+xf_1(n,col)*xf_1(n+m,col);
            step2=step2+xf_1(n,col)^2;
            step3=step3+xf_1(n+m,col)^2;
        end
        normalization_of_candidate(m,col)=step1/sqrt(step2*step3);        
    end
end

nc = normalization_of_candidate;

ncc = normxcorr2(nc,nt);
figure, surf(ncc), shading flat

[ypeak, xpeak] = find(ncc==max(ncc(:)));

yoffSet = ypeak-size(image_to_binary_c,1);
xoffSet = xpeak-size(image_to_binary_c,2);
hFig = figure;
hAx  = axes;
imshow(image_to_binary_t,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(image_to_binary_c,2), size(image_to_binary_c,1)]);