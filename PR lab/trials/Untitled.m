clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Project\new (times new roman)\5_candidate.jpg');
%ImageShow = imshow(ImageRead);

ImageR = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\Template_1.jpg');
%ImageS = imshow(ImageR);

cit = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(cit);
ty = graythresh(ct);

bic = im2bw(cit, t);
%b = not(bil);
imshow(bic);
bit = im2bw(ct, ty);
%bi = not(bit);
figure(), imshow(bit);

N=length(bic); %// length of signal
%n1=128;  %// length of window
xf=bit; %framing(bic,n1,n1/2,rectwin(n1)); %this function frames the signal i will get xf(128,14)
win_num=size(xf,2);
M0=size(bic,2);

ccor=NaN(M0-1,win_num);
for col=1:win_num
    for m=1:M0-1,
        [term1,term2,term3]=deal(0);
        for n=1:N-m,
            term1=term1+xf(n,col)*xf(n+m,col);
            term2=term2+xf(n,col)^2;
            term3=term3+xf(n+m,col)^2;
        end
        ccor(m,col)=term1/sqrt(term2*term3);        
    end
end

co = ccor;


N_1=length(bic); %// length of signal
%n1=128;  %// length of window
xf_1=bic; %framing(bic,n1,n1/2,rectwin(n1)); %this function frames the signal i will get xf(128,14)
win_num_1=size(xf_1,2);
M0_1=size(bic,2);

ccor_1=NaN(M0_1-1,win_num_1);
for col=1:win_num_1
    for m=1:M0_1-1,
        [term1,term2,term3]=deal(0);
        for n=1:N_1-m,
            term1=term1+xf_1(n,col)*xf_1(n+m,col);
            term2=term2+xf_1(n,col)^2;
            term3=term3+xf_1(n+m,col)^2;
        end
        ccor_1(m,col)=term1/sqrt(term2*term3);        
    end
end

co_1 = ccor_1;

c = normxcorr2(co_1,co);

%d = not(c);
[ypeak, xpeak] = find(c==max(c(:)));
% 
% %checking sizes
tr = size(bic,1);
tr_1 = size(bic,2);
% %checking sizes
% 
yoffSet = ypeak-size(bic,1);
xoffSet = xpeak-size(bic,2);
hFig = figure;
hAx  = axes;
imshow(bit,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(bic,2), size(bic,1)]);
