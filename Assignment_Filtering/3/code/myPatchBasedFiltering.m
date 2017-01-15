function [ outputImage ] = myPatchBasedFiltering( inputImage, sigma_patch,sigma_space, windowSizeSmall, windowSizeLarge )
tic;
outputImage = zeros(size(inputImage));

%compute size of image
[rows columns] = size(inputImage);
 
% add noise to the image
std_dev = 0.05*max(inputImage(:));
noise = std_dev*randn(size(inputImage));
img_noise = inputImage + noise;
img_noise = single(img_noise);
img_noise  =round(img_noise);
%figure
%imshow(img_noise, [min(img_noise(:)), max(img_noise(:))]);

% img_noise is the corrupted image

%computing the distance gaussian which would be same for all windows
mid_small = (windowSizeSmall -1)/2;
mid_large = (windowSizeLarge - 1)/2;
mid = mid_small + mid_large;

index = -mid_large:mid_large;
index = index.^2;
dest_mat = repmat(index, [windowSizeLarge,1]);
distances = dest_mat + dest_mat';
distances = sqrt(distances);
distances_g = normpdf(distances, 0 , sigma_space);


%create a padded image for convolution
padded_img = zeros([rows+windowSizeSmall+windowSizeLarge, columns+windowSizeSmall+windowSizeLarge]);
padded_img(mid+1:mid+rows, mid+1:mid+columns) = img_noise;
for i = mid+1:mid+rows
    for j = mid+1:columns+mid
        I_p = padded_img(i,j);
        intensities = getNeighbourhoodWindow(padded_img,i,j,windowSizeLarge);
        patches = getNeighbourhoodWindow(padded_img,i,j,windowSizeLarge+windowSizeSmall-1);
        %intensities_g = normpdf((intensities-I_p), 0, sigma_range);
        weights = patch_weights(patches, windowSizeSmall, windowSizeLarge, sigma_patch);
        %disp(weights);
        %W_p = intensities_g.*distances_g;
        %WI_p = W_p.*intensities;
        weight_new = weights.*distances_g;
        weight_new = weight_new/sum(weight_new(:));
        new_intensities = weight_new.*intensities;
        outputImage(i-mid, j-mid) = sum(new_intensities(:));
    end
end
 toc;
figure
imshow(outputImage, [min(outputImage(:)), max(outputImage(:))]);
        
        

end

