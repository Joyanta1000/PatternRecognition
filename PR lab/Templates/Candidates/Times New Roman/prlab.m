f = imread('C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\Template.jpg');
size(f);
[M, N] = size(f);
whos f; 

low = 200*200;
high = 500*500;

imshow(f, [low high]);

imshow(f, [ ]);

imshow(f);

f = imread('C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\1.jpg');
size(f);
[M, N] = size(f);
 
low = 200*200;
high = 500*500;

imshow(f, [low high]);
imshow(f, [ ]);
imshow(f);

figure, imshow(f);

g = imread('C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\2.jpg');
figure, imshow(g);

imshow(f), figure, imshow(g);

h = imread('C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\3.jpg');
 
imshow(h, { });

imshow(h, [ ]);

imwrite(f,'trial.jpg');
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial.jpg');
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial1.jpg', '900', '25');

 
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial1.jpg', '30*30', '25');
 
quality = 900;
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial1.jpg', 'quality', 25);
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial1.jpg', '400', 25);
 
quality = 400;
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial1.jpg', 'quality', 25);
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial2.jpg', 'quality', 25);
quality = 30;
imwrite(f,'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\trial3.jpg', 'quality', 25);

imfinfo 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\4.jpg';
imfinfo 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\5.jpg';
 
imfinfo 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\5.jpg';
 
imfinfo 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\5.jpg';
 
imfinfo 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\5.jpg';
k = imfinfo('C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\5.jpg');
 
image_bytes = k.Width*k.Height*k.BitDepth/8;
compressed_bytes = k.FileSize;
compression_ratio = image_bytes/compressed_bytes;
 
compression = 71369;
parameter = 200;
resolution = 72;
 
colres = 100;
rowres = 100;
 
res = round(200*2.25/1.5);
imwrite(f, 'C:\Users\Joyanta\Dropbox\My PC (Joyanta-PC)\Desktop\Templates\Candidates\Times New Roman\file1.tif', 'compression', 'none', 'resolution', res);

h = imread('D:\Last Semester\PR\PR lab\Patterns\new (times new roman)\3_candidate.jpg');
B = logical(h);
C = islogical(B);