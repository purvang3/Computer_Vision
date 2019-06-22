original_image = imread('image.bmp');
imshow(original_image);

%% For Thresholding:

clc;
clear all;

image = imread('image.bmp');
image_size = size(image);
H=zeros(1,256);
%max_intensity = max(max(image));
meanIntensity = mean(mean(image));  
for i = 1:948 
    for j = 1:1268
        c = image(i,j);
        H(c+1) = H(c+1)+1;
        if image(i,j) >= meanIntensity
            tempImage(i,j) = 1;
        else
            tempImage(i,j) = 0;
        end
     end
end
figure(1);
plot(H);
figure(2);
imshowpair(image,tempImage,'montage');

%% For Contrast Stretching:

clc;
clear all;
original_image = imread('image.bmp');
a = 0;
b = 255;
c = min(min(original_image));
d = max(max(original_image));
range = d-c;
limit = double((double(range)/100)*5);
 
 
factor = (d - c)/(d + c);
for i = 1:948
    for j = 1:1268
        if((((original_image(i,j) - factor)*(b - a)/(d - c)) + a)>= 0)
            if((original_image(i,j)>(c +limit) || original_image(i,j)<(d - limit)))
                part1 = (original_image(i,j) - factor);
                const = (b - a)/(d - c);
                fina = part1*const + a;
                new_image(i,j) = fina;
            elseif((original_image(i,j)<(c +limit)))
                new_image(i,j) = a;
            elseif(original_image(i,j)<(d - limit))
                new_image(i,j) = b;
            end
        else
            new_image(i,j) = 0;
        end
    end
end
figure(3);
imshowpair(original_image,new_image,'montage')


%% For Gamma Correction:

clc;
clear all;
original_image = imread('image.bmp');
original_image = double(original_image);
c = min(min(original_image));
d = max(max(original_image));
factor = (d-c)/(d+c);
gamma = 0.3;
 
for i = 1:948
    for j = 1:1268
        new_image(i,j) = factor * (original_image(i,j) ^ gamma);
    end
end
figure(4); 
imshowpair(original_image,new_image,'montage')


%% For Histogram Equalization:

clc;
clear all;
original_image = imread('image.bmp');
c = min(min(original_image));
d = max(max(original_image));
L = 256;
p = zeros(1,256);
total_pixels = 948 * 1268;
 
for i = 1:948
    for j = 1:1268
        temp = original_image(i,j);
        p(1,temp) = p(1,temp) + 1;
    end
end
sum = 0;
 
for i = 1:256
    p(1,i) = double(p(1,i)/total_pixels);
    sum = sum + p(1,i);
    cdf(i) = sum;
end
 
 
 
for i = 1:948
    for j = 1:1268
        new_image(i,j) = floor((L-1)*cdf(original_image(i,j))) ;
    end
end

figure(5);
imshowpair(original_image,new_image,'montage');




