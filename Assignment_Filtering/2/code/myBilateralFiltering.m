function [ outputImage ] = myBilateralFiltering( inputImage, sigma_space, sigma_range, windowSize )
tic;
outputImage = zeros(size(inputImage));

%compute size of image
[rows columns] = size(inputImage);
 
% add noise to the image
std_dev = 0.05*max(inputImage(:));
noise = std_dev*randn(size(inputImage));
img_noise = inputImage + noise;
img_noise = single(img_noise);
figure
imshow(img_noise, [min(img_noise(:)), max(img_noise(:))]);

% img_noise is the corrupted image

%computing the distance gaussian which would be same for all windows
mid = (windowSize -1)/2;
index = [-mid:mid];
index = index.^2;
dest_mat = repmat(index, [windowSize,1]);
distances = dest_mat + dest_mat';
distances = sqrt(distances);
distances_g = normpdf(distances, 0 , sigma_space);

%create a padded image for convolution
padded_img = zeros([rows+windowSize, columns+windowSize]);
padded_img(mid+1:mid+rows, mid+1:mid+columns) = img_noise;

for i = mid+1:mid+rows
    for j = mid+1:columns+mid
        I_p = padded_img(i,j);
        intensities = getNeighbourhoodWindow(padded_img,i,j,windowSize);
        intensities_g = normpdf((intensities-I_p), 0, sigma_range);
        W_p = intensities_g.*distances_g;
        WI_p = W_p.*intensities;
        outputImage(i-mid, j-mid) = sum(WI_p(:))/sum(W_p(:));
    end
end
figure

imshow(outputImage, [min(outputImage(:)), max(outputImage(:))]);
toc;
        

end

