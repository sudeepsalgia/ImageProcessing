function [coefficients] = dct_coefficients()
%This function is to plot the DCT coefficients of the patches

% Read the images and apply some basic edits to make them suitable for the
% purpose. And then store the sizes of the image
img1 =  imread('d5.jpg');
img1 = rgb2gray(img1);
img2 = imread('d6.png');
img2 = imresize(img2, [1136 736]);

[m1 n1] = size(img1);
[m2 n2] = size(img2);

% Initialize a matrix to store the coefficients.
coefficients = [];

%Construct the DCT basis matrix for 8X8 patches
U = kron(dctmtx(8)',dctmtx(8)');

% Loop over the patches of the first image to get all the coefficients
for i = 1:(m1/8)
    for j = 1:(n1/8)
        patch = img1(8*(i-1)+1:8*i,8*(j-1)+1:8*j);  
        x = double(patch(:));
        theta = U'*x;
        coefficients = [coefficients theta];
    end
end

% Loop over the patches of the second image to get all the coefficients
for i = 1:(m2/8)
    for j = 1:(n2/8)
        patch = img2(8*(i-1)+1:8*i,8*(j-1)+1:8*j);  
        x = double(patch(:));
        theta = U'*x;
        coefficients = [coefficients theta];
    end
end


end
