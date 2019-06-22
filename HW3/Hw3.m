clc;
clear all;
close all;
original_image = imread('Text.bmp');
figure(1)
imshow(original_image)
%%
maxIntensity = max(max(original_image));
histograme = zeros(1,maxIntensity);

for i = 1:600
    for j = 1:800
        temp = original_image(i,j);
        histograme(1,temp) = histograme(1,temp) + 1;
    end
end
figure(2)
plot(histograme);

%% Thresholding
meanIntensity = mean(mean(original_image));
for i = 1:600
    for j = 1:800
        if original_image(i,j) <= meanIntensity
            tempImage(i,j) = 1;
        else
            tempImage(i,j) = 0;
        end
    end
end
figure(4)
imshow(tempImage);

%% Final Erosin

% original_image = imread('bottle.bmp');
% tempo = 0
% meanIntensity = mean(mean(original_image));
% for i = 1:600
%     for j = 1:800
%         if original_image(i,j) <= meanIntensity
%             tempImage(i,j) = 1;
%         else
%             tempImage(i,j) = 0;
%         end
%     end
% end

tempo1 = 0;
tempImage1 = tempImage;
an = tempImage1;
% figure, imshow(a)
% an=imnoise(a,'gaussian');
[m,n]=size(an);
% figure, imshow(uint8(an))
b=input('Enter Averaging Mask size: ');
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));
for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=an(i-(x-1),j-(x-1));
    end
end
% figure, imshow(uint8(anz))
sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        tempImage2(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end
% figure, imshow(uint8(tempImage))

structuring_element = [1 1 1;1 1 1;1 1 1];

for z =1:5
tempImage2 = padarray(tempImage2,[1,1],1);
    for i = 2:601
        for j = 2:801
        m1 = 1;
            for k = i-1:i+1
            n1 = 1;
                for l = j-1:j+1
                    surrounding(m1,n1) = tempImage2(k,l);
                    D1 = tempo1 + surrounding(m1,n1) * (1);
                    tempo1 = D1;
                    n1 = n1+1;
                end
                m1 = m1+1;
            end
            tempo1 = 0;
            
            if (D1 >= 9)
                x(i-1,j-1) = 1;
            else
                x(i-1,j-1) = 0;
            end

%             if(surrounding == structuring_element)
%                 x(i-1,j-1) = 1;
%             else
%                 x(i-1,j-1) = 0;
            end
        end
    end
    temp2 = x;
figure(5)
imshowpair(temp2,tempImage,'montage')

%%

% % Part 4 erosion
% tempImage1 = tempImage;
% an = tempImage1;
% % figure, imshow(a)
% % an=imnoise(a,'gaussian');
% [m,n]=size(an);
% % figure, imshow(uint8(an))
% b=input('Enter Averaging Mask size: ');
% z=ones(b);
% [p,q]=size(z);
% w=1:p;
% x=round(median(w));
% anz=zeros(m+2*(x-1),n+2*(x-1));
% for i=x:(m+(x-1))
%     for j=x:(n+(x-1))
%         anz(i,j)=an(i-(x-1),j-(x-1));
%     end
% end
% % figure, imshow(uint8(anz))
% sum=0;
% x=0;
% y=0;
% for i=1:m
%     for j=1:n
%         for k=1:p
%             for l=1:q 
%                 sum= sum+anz(i+x,j+y)*z(k,l);
%                 y=y+1;
%             end
%             y=0;
%             x=x+1;
%         end
%         x=0;
%         tempImage2(i,j)=(1/(p*q))*(sum);
%         sum=0;
%     end
% end
% % figure, imshow(uint8(tempImage))
% 
% structuring_element = [1 1 1;1 1 1;1 1 1];
% 
% for z =1:5
% tempImage2 = padarray(tempImage2,[1,1],1);
%     for i = 2:601
%         for j = 2:801
%         m1 = 1;
%             for k = i-1:i+1
%             n1 = 1;
%                 for l = j-1:j+1
%                     surrounding(m1,n1) = tempImage2(k,l);
%                     n1 = n1+1;
%                 end
%                 m1 = m1+1;
%             end
%             if(surrounding == structuring_element)
%                 x(i-1,j-1) = 1;
%             else
%                 x(i-1,j-1) = 0;
%             end
%         end
%     end
%     temp2 = x;
% end
% figure(5)
% imshowpair(temp2,tempImage,'montage')

%% Final Dilation

% original_image = imread('bottle.bmp');
% tempo = 0
% meanIntensity = mean(mean(original_image));
% for i = 1:600
%     for j = 1:800
%         if original_image(i,j) <= meanIntensity
%             tempImage(i,j) = 1;
%         else
%             tempImage(i,j) = 0;
%         end
%     end
% end
tempo = 0
tempImage1 = tempImage;
an = tempImage1;
% figure, imshow(a)
% an=imnoise(a,'gaussian');
[m,n]=size(an);
% figure, imshow(uint8(an))
b=input('Enter Averaging Mask size: ');
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));
for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=an(i-(x-1),j-(x-1));
    end
end
% figure, imshow(uint8(anz))
sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        tempImage3(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end
% figure, imshow(uint8(tempImage))

structuring_element = [1 1 1;1 1 1;1 1 1];


for z =1:5
tempImage3 = padarray(tempImage3,[1,1],1);
    for i = 2:601
        for j = 2:801
        m2 = 1;
            for k = i-1:i+1
            n2 = 1;
                for l = j-1:j+1
                    surrounding(m2,n2) = tempImage3(k,l);
                    D = tempo + surrounding(m2,n2) * (1);
                    tempo = D;
                    n2 = n2+1;
                end
                m2 = m2+1;
            end
            tempo = 0;
            
            if (D >= 1)
                x(i-1,j-1) = 1;
            else
                x(i-1,j-1) = 0;
            
%             if(surrounding == structuring_element)
%                 x(i-1,j-1) = 1;
%             else
%                 x(i-1,j-1) = 0;
            end
        end
    end
    tempImage4 = x;
end

figure(6)
imshowpair(tempImage4,tempImage,'montage')

%%

%%%%%% Part 5 Dilation

% tempImage1 = tempImage;
% an = tempImage1;
% % figure, imshow(a)
% % an=imnoise(a,'gaussian');
% [m,n]=size(an);
% % figure, imshow(uint8(an))
% b=input('Enter Averaging Mask size: ');
% z=ones(b);
% [p,q]=size(z);
% w=1:p;
% x=round(median(w));
% anz=zeros(m+2*(x-1),n+2*(x-1));
% for i=x:(m+(x-1))
%     for j=x:(n+(x-1))
%         anz(i,j)=an(i-(x-1),j-(x-1));
%     end
% end
% % figure, imshow(uint8(anz))
% sum=0;
% x=0;
% y=0;
% for i=1:m
%     for j=1:n
%         for k=1:p
%             for l=1:q 
%                 sum= sum+anz(i+x,j+y)*z(k,l);
%                 y=y+1;
%             end
%             y=0;
%             x=x+1;
%         end
%         x=0;
%         tempImage3(i,j)=(1/(p*q))*(sum);
%         sum=0;
%     end
% end
% % figure, imshow(uint8(tempImage))
% 
% structuring_element = [1 1 1;1 1 1;1 1 1];
% 
% 
% for z =1:5
% tempImage3 = padarray(tempImage3,[1,1],1);
%     for i = 2:601
%         for j = 2:801
%         m2 = 1;
%             for k = i-1:i+1
%             n2 = 1;
%                 for l = j-1:j+1
%                     surrounding(m2,n2) = tempImage3(k,l);
%                     n2 = n2+1;
%                 end
%                 m2 = m2+1;
%             end
%             if(surrounding == structuring_element)
%                 x(i-1,j-1) = 1;
%             else
%                 x(i-1,j-1) = 0;
%             end
%         end
%     end
%     tempImage4 = x;
% end
% 
% figure(6)
% imshowpair(tempImage4,tempImage,'montage')


%% part 6

difference_image = abs((tempImage) - (temp2));
maxIntensity = max(max(difference_image));
histograme = zeros(1,maxIntensity);

for i = 1:600
    for j = 1:800
        temp = difference_image(i,j);
        histograme(1,temp) = histograme(1,temp) + 1;
    end
end
figure(9)
plot(histograme);
% figure; % Open up another figure window.
% %imshow(uint8(difference_image, [])); 
% % Display the difference image.
% imshow(difference_image)
%%
            
tempImage1 = tempImage;
an = tempImage1;
% figure, imshow(a)
% an=imnoise(a,'gaussian');
[m,n]=size(an);
% figure, imshow(uint8(an))
b=input('Enter Averaging Mask size: ');
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));
for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=an(i-(x-1),j-(x-1));
    end
end
% figure, imshow(uint8(anz))
sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        tempImage2(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end
% figure, imshow(uint8(tempImage))

structuring_element = [1 1 1;1 1 1;1 1 1];

for z =1:10
tempImage2 = padarray(tempImage2,[1,1],1);
    for i = 2:601
        for j = 2:801
        m = 1;
            for k = i-1:i+1
            n= 1;
                for l = j-1:j+1
                    surrounding(m,n) = tempImage2(k,l);
                    n = n+1;
                end
                m = m+1;
            end
            if(surrounding == structuring_element)
                x(i-1,j-1) = 1;
            else
                x(i-1,j-1) = 0;
            end
        end
    end
    temp = x;
end
figure(5)
imshowpair(tempImage2,tempImage)
    
    







            
