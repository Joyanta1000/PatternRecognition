c = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\2_candidate.jpg');
t = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\Template_1.jpg');

candidate = c;
template = t;

imshow(candidate)
figure, imshow(template)

%rect_onion = [111 33 65 58];
%rect_peppers = [163 47 143 151];
%sub_onion = imcrop(onion,rect_onion);
%sub_peppers = imcrop(peppers,rect_peppers);

% OR 
   
% interactively
[sub_candidate,rect_candidate] = imcrop(candidate); % choose the pepper below the onion
[sub_template,rect_template] = imcrop(template); % choose the whole onion

% display sub images

figure, imshow(sub_candidate)
figure, imshow(sub_template)

c = normxcorr2(sub_candidate(:,:,1),sub_template(:,:,1));
figure, surf(c), shading flat

% offset found by correlation
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
corr_offset = [(xpeak-size(sub_candidate,2)) 
               (ypeak-size(sub_candidate,1))];

% relative offset of position of subimages
rect_offset = [(rect_template(1)-rect_candidate(1)) 
               (rect_template(2)-rect_candidate(2))];

% total offset
offset = corr_offset + rect_offset;
xoffset = offset(1);
yoffset = offset(2);

xbegin = round(xoffset+1);
xend   = round(xoffset+ size(candidate,2));
ybegin = round(yoffset+1);
yend   = round(yoffset+size(candidate,1));

% extract region from peppers and compare to onion
extracted_candidate = template(ybegin:yend,xbegin:xend,:);
if isequal(candidate,extracted_candidate) 
   disp('1_candidate.jpg was extracted from Template_1.jpg')
end

recovered_candidate = uint8(zeros(size(template)));
recovered_candidate(ybegin:yend,xbegin:xend,:) = candidate;
figure, imshow(recovered_candidate)

figure, imshowpair(template(:,:,1),recovered_candidate,'blend')

dbstop if error