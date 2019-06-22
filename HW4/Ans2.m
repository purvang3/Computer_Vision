clc;
clear all;
close all;
original_img = imread('image.bmp');
figure(1);
imshow(original_img);
title('First Level');
gaussian_kernel=[1/16 1/4 6/16 1/4 1/16];
padded_img1 = padarray(original_img,[2 2], 0);
 
for i=3:+2:948
    for j=3:+2:1268
        final_img1((i),(j))= gaussian_kernel(1,1)*padded_img1(i,j-2) +  gaussian_kernel(1,2)*padded_img1(i,j-1) + gaussian_kernel(1,3)*padded_img1(i,j) + gaussian_kernel(1,4)*padded_img1(i,j+1) + gaussian_kernel(1,5)*padded_img1(i,j+2);
    end
end
temp11=final_img1(3:2:end,:);
temp12=transpose(temp11);
final_img1=temp12(3:2:end,:);
final_img1=transpose(final_img1); 
figure(2);
imshow(final_img1);
title('Second Level');

padded_img2 = padarray(final_img1,[2 2],0);
for i=3:+2:473
    for j=3:+2:633
        final_img2((i),(j))= gaussian_kernel(1,1)*padded_img2(i,j-2) +  gaussian_kernel(1,2)*padded_img2(i,j-1) + gaussian_kernel(1,3)*padded_img2(i,j) + gaussian_kernel(1,4)*padded_img2(i,j+1) + gaussian_kernel(1,5)*padded_img2(i,j+2);
    end
end
temp21=final_img2(3:2:end,:);
temp22=transpose(temp21);
final_img2=temp22(3:2:end,:);
final_img2=transpose(final_img2);
figure(3)
imshow(final_img2);
title('Third Level');
 
padded_img3 = padarray(final_img2,[2 2],0);
for i=3:+2:237
    for j=3:+2:317
        final_img3((i),(j))= gaussian_kernel(1,1)*padded_img3(i,j-2) +  gaussian_kernel(1,2)*padded_img3(i,j-1) + gaussian_kernel(1,3)*padded_img3(i,j) + gaussian_kernel(1,4)*padded_img3(i,j+1) + gaussian_kernel(1,5)*padded_img3(i,j+2);
    end
end
temp31=final_img3(3:2:end,:);
temp32=transpose(temp31);
final_img3=temp32(3:2:end,:);
final_img3=transpose(final_img3); 
figure(4)
imshow(final_img3);
title('Forth Level');

padded_img4 = padarray(final_img3,[2 2],0);
for i=3:+2:118
    for j=3:+2:158
        final_img4((i),(j))= gaussian_kernel(1,1)*padded_img4(i,j-2) +  gaussian_kernel(1,2)*padded_img4(i,j-1) + gaussian_kernel(1,3)*padded_img4(i,j) + gaussian_kernel(1,4)*padded_img4(i,j+1) + gaussian_kernel(1,5)*padded_img4(i,j+2);
    end
end
temp41=final_img4(3:2:end,:);
temp42=transpose(temp41);
final_img4=temp42(3:2:end,:);
final_img4=transpose(final_img4); 
figure(5)
imshow(final_img4);
title('Fifth Level');
 
%% 

clc;
clear all;
close all;
original_img= imread('image.bmp');
figure(1);
imshow(original_img);
title('First Level');
Laplacian_Kernel=[1/16 1/4 6/16 1/4 1/16]; 
padded_img1 = padarray(original_img,[2 2],0);
for i=3:+2:948
    for j=3:+2:1268
        final_img1((i),(j))= Laplacian_Kernel(1,1)*padded_img1(i,j-2) +  Laplacian_Kernel(1,2)*padded_img1(i,j-1) + Laplacian_Kernel(1,3)*padded_img1(i,j) + Laplacian_Kernel(1,4)*padded_img1(i,j+1) + Laplacian_Kernel(1,5)*padded_img1(i,j+2);
    end
end
temp11=final_img1(3:2:end,:);
temp12=transpose(temp11);
final_img1 = temp12(3:2:end,:);
final_img11 =transpose(final_img1); 
figure(2);
imshow(final_img11);


[a1 b1] = size(final_img11);
scale = 2;
M = zeros(scale.*a1,scale.*b1);
for count1 = 1:scale:a1.*scale
    for count2 = 1:scale:b1.*scale
        for count3 = 1:scale
            for count4 = 1:scale
                M1(count1+count3+1,count2+count4+1) = final_img11(ceil(count1./scale),ceil(count2./scale));
            end
        end
    end
end
inter_img1 = (uint8(M1));
final_img111= original_img-inter_img1;
figure(3);
imshow(final_img111);
title('Second Level');

%

padded_img2 = padarray(final_img11,[2 2],0);
for i=3:+2:473
    for j=3:+2:633
        final_img2((i),(j))= Laplacian_Kernel(1,1)*padded_img2(i,j-2) +  Laplacian_Kernel(1,2)*padded_img2(i,j-1) + Laplacian_Kernel(1,3)*padded_img2(i,j) + Laplacian_Kernel(1,4)*padded_img2(i,j+1) + Laplacian_Kernel(1,5)*padded_img2(i,j+2);
    end
end
temp21=final_img2(3:2:end,:);
temp22=transpose(temp21);
final_img2=temp22(3:2:end,:);
final_img22=transpose(final_img2);
figure(4)
imshow(final_img22);

[a2 b2] = size(final_img22);
scale = 2;
M = zeros(scale.*a2,scale.*b2);
for count1 = 1:scale:a2.*scale
    for count2 = 1:scale:b2.*scale
        for count3 = 1:scale
            for count4 = 1:scale
                M2(count1+count3,count2+count4) = final_img22(ceil(count1./scale),ceil(count2./scale));
            end
        end
    end
end
inter_img2 = (uint8(M2));
final_img222= final_img11-inter_img2;
figure(5);
imshow(final_img222);
title('Third Level');

%

padded_img3 = padarray(final_img22,[2 2],0);
for i=3:+2:237
    for j=3:+2:317
        final_img3((i),(j))= Laplacian_Kernel(1,1)*padded_img3(i,j-2) +  Laplacian_Kernel(1,2)*padded_img3(i,j-1) + Laplacian_Kernel(1,3)*padded_img3(i,j) + Laplacian_Kernel(1,4)*padded_img3(i,j+1) + Laplacian_Kernel(1,5)*padded_img3(i,j+2);
    end
end
temp31=final_img3(3:2:end,:);
temp32=transpose(temp31);
final_img3=temp32(3:2:end,:);
final_img33=transpose(final_img3);
figure(6)
imshow(final_img33);

[a3 b3] = size(final_img33);
scale = 2;
M = zeros(scale.*a3,scale.*b3);
for count1 = 1:scale:a3.*scale
    for count2 = 1:scale:b3.*scale
        for count3 = 1:scale
            for count4 = 1:scale
                M3(count1+count3-1,count2+count4-1) = final_img33(ceil(count1./scale),ceil(count2./scale));
            end
        end
    end
end
inter_img3 = (uint8(M3));
final_img333= final_img22-inter_img3;
figure(7);
imshow(final_img333);
title('Forth Level');

%

padded_img4 = padarray(final_img33,[2 2],0);
for i=3:+2:118
    for j=3:+2:158
        final_img4((i),(j))= Laplacian_Kernel(1,1)*padded_img4(i,j-2) +  Laplacian_Kernel(1,2)*padded_img4(i,j-1) + Laplacian_Kernel(1,3)*padded_img4(i,j) + Laplacian_Kernel(1,4)*padded_img4(i,j+1) + Laplacian_Kernel(1,5)*padded_img4(i,j+2);
    end
end
temp41=final_img4(3:2:end,:);
temp42=transpose(temp41);
final_img4=temp42(3:2:end,:);
final_img44=transpose(final_img4);
figure(8);
imshow(final_img44);

[a4 b4] = size(final_img44);
scale = 2;
M = zeros(scale.*a4,scale.*b4);
for count1 = 1:scale:a4.*scale
    for count2 = 1:scale:b4.*scale
        for count3 = 1:scale
            for count4 = 1:scale
                M4(count1+count3+1,count2+count4+1) = final_img44(ceil(count1./scale),ceil(count2./scale));
            end
        end
    end
end
inter_img4 = (uint8(M4));
final_img444= final_img33-inter_img4;
figure(9);
imshow(final_img444);
title('Fifth Level');


