function [] = plot_patch_variances()
% This function plots the variances of the patches of the images d5 and d6
% to estimate the values of the spread of the variances

% Read the images and apply some basic edits to make them suitable for the
% purpose. And then store the sizes of the image
img1 =  imread('d5.jpg');
img1 = rgb2gray(img1);
img2 = imread('d6.png');
img2 = imresize(img2, [1136 736]);

[m1 n1] = size(img1);
[m2 n2] = size(img2);

variances = [];


% Loop over the patches of the first image to get all the patches
for i = 1:(m1/8)
    for j = 1:(n1/8)
        patch = img1(8*(i-1)+1:8*i,8*(j-1)+1:8*j);  
        x = double(patch(:));
        xbar = (x - mean(x))/255;
        variances = [variances sum(xbar.^2)/63];
    end
end

% Loop over the patches of the second image to get all the patches
for i = 1:(m2/8)
    for j = 1:(n2/8)
        patch = img2(8*(i-1)+1:8*i,8*(j-1)+1:8*j);  
        x = double(patch(:));
        xbar = (x - mean(x))/255;
        variances = [variances sum(xbar.^2)/63];
    end
end

% Plot the values using a histogram 
hist(variances, 20);


% This function was mainly used to determine the value of b which came to
% be roughly 0.18
end