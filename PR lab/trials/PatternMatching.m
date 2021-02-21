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

b = im2bw(c, t);
%b = not(bil);
imshow(b);
bi = im2bw(ct, ty);
%bi = not(bit);
figure(), imshow(bi);
%c1 = 1/100*sum{[b(10)-mean(b)]*[bi(10)-mean(bi)]}/(sqrt(var(b)*var(bi)));


%ist way to normalize
c = normxcorr2(b,bi);
figure, surf(c), shading flat;
%ist way to normalize

[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(b,1);
xoffSet = xpeak-size(b,2);
hFig = figure;
hAx  = axes;
imshow(bi,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(b,2), size(b,1)]);

%lm = mean(b);
%lm1 = mean(bi);

%for v = max(lm)
   %disp(v)
        %I1 = ((v-(min(lm)))*1)/(max(lm)-min(lm));
%end
%for v2 = max(lm1)
   %disp(v)
        %I2 = ((v2-(min(lm1)))*1)/(max(lm1)-min(lm1));
%end

%2nd way to normalize
candidate_image_normalized = (b-min(b(:)))/(max(b(:))-min(b(:)));
template_image_normalized = (bi-min(bi(:)))/(max(bi(:))-min(bi(:)));
two_images_normalized = normxcorr2(candidate_image_normalized,template_image_normalized);
%2nd way to normalize

%3rd way to normalize
x = double(b);
y = double(bi);
sum = 0;
sum_of_nex = 0;
sum_of_nex_y = 0;

for n = 1 : length(y)

  for k = 1 : x(n)
    next = k;
  end
  for k_1 = 1 : y(n)
    next_y = k_1;
  end
  
  multiply = next * next_y;
  
  sum = sum + multiply;
end


for n = 1 : length(y)

  for k = 1 : x(n)
    nex = k*k;
  end
  for k_1 = 1 : y(n)
    nex_y = k_1 * k_1;
  end
  sum_of_nex = sum_of_nex+nex;
  sum_of_nex_y = sum_of_nex_y + nex_y;
end

ino = sum_of_nex * sum_of_nex_y;
norm_den = sqrt(ino);

norm_corr = sum / norm_den;
%figure, surf(norm_corr), shading flat;
%3rd way to normalize

[ypeak, xpeak] = find(norm_corr==max(norm_corr(:)));
yoffSet = ypeak-size(b,1);
xoffSet = xpeak-size(b,2);
hFig = figure;
hAx  = axes;
imshow(bi,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(b,2), size(b,1)]);

len = length(x);

Normalised_CrossCorr = 1/len * sum{ [x(len) - mean(x)]* [y(len) - mean(y)] }/ (sqrt(var(x)*var(y)));
