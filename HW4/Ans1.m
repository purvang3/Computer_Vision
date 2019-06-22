clc;
close all;
clear all;
original_img = imread('Connected.bmp');
size_of_image = size(original_img);
no_of_rows = size_of_image(1);
no_of_cols = size_of_image(2);
figure(1);
imshow(original_img);
title('Original Image')
label = 1;
num = 1;
 
for i = 1:no_of_rows
    for j = 1:no_of_cols
        if(original_img(i,j) > 0)
            threshold_img(i,j) = 1;
        else
            threshold_img(i,j) = original_img(i,j);
        end
    end
end
figure(2);
imshow(threshold_img);
title('Thresholded Image')

for i = 1:no_of_rows
    for j = 1:no_of_cols
        if (i ==1)
            if(j==1)
                inter_img(i,j) = label;
            else
               if((threshold_img(i,j) == threshold_img(i,j-1)))
                   inter_img(i,j) = inter_img(i,j-1);
               else
                   label = label+1;
                   inter_img(i,j) = label;
               end
            end
        else
            if(j==1)
                if(threshold_img(i,j) == threshold_img(i-1,j))
                    inter_img(i,j) = inter_img(i-1,j);
                else
                    label = label+1;
                    inter_img(i,j) = label;
                end
            else
                if(threshold_img(i,j) ~= threshold_img(i,j-1) && threshold_img(i,j) ~= threshold_img(i-1,j))
                    label = label+1;
                    inter_img(i,j) = label;
                else
                    if(threshold_img(i,j) == threshold_img(i,j-1) && threshold_img(i,j) == threshold_img(i-1,j))
                        inter_img(i,j) = min(inter_img(i,j-1),inter_img(i-1,j));
                        if(inter_img(i,j-1) ~= inter_img(i-1,j))
                            match1(num) = inter_img(i-1,j);
                            match2(num) = inter_img(i,j-1);
                            num = num+1;
                        end
                    else
                        if(threshold_img(i,j) == threshold_img(i-1,j))
                            inter_img(i,j) = inter_img(i-1,j);
                        else
                            inter_img(i,j) = inter_img(i,j-1);
                        end
                    end
                end
            end
        end
    end
end
 
labels = zeros(max(max(inter_img)),1);
pixel = 1;
for i = 1:length(match1)
   if(labels(match1(i)) == 0 && labels(match2(i)) == 0)
       labels(match1(i)) = min((match1(i)),(match2(i)));
       labels(match2(i)) = min((match1(i)),(match2(i)));
   elseif(labels(match1(i)) == 0 || labels(match2(i)) == 0)
       if(labels(match1(i)) ~= 0)
           labels(match2(i)) = labels(match1(i));
       else
           labels(match1(i)) = labels(match2(i));
       end
   elseif(labels(match1(i)) ~= 0 && labels(match2(i)) ~= 0)
       previous = max(labels(match1(i)),labels(match2(i)));
       labels(match1(i))= min(labels(match1(i)),labels(match2(i)));
       labels(match2(i)) = min(labels(match1(i)),labels(match2(i)));
       for k=1:length(labels)
           if(labels(k) == previous)
               labels(k) = min(labels(match1(i)),labels(match2(i)));
           end
       end
   end
end

for i=1:no_of_rows
    for j=1:no_of_cols
        if(labels(inter_img(i,j)) == 0)
            final_img(i,j) = inter_img(i,j);
        else
            final_img(i,j) = labels(inter_img(i,j));
        end
    end
end
 
sum = 0;
for i=1:length(labels)
    if(labels(i) == 0)
        sum = sum+1;
    end
end
 
if (sum==0)
    no_of_connected_components = length(unique(labels));
else
    no_of_connected_components = length(unique(labels)) - 1 + sum;
end
 
max_value=max(max(final_img));
final = round(final_img*(256/max_value+1));
figure(3);
imshow(uint8(final));
title('Connected Components')
