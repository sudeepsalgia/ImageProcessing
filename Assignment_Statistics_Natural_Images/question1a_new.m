function [output_image] = question1a_new()

%Read the image 
image = imread('barbara256.png');
[m n] = size(image);

% The code is written assuming the patchsize is 8 which is a standard
% value. It can be changed to other values using small adaptations.

%Construct the DCT basis matrix for 8X8 patches
U = kron(dctmtx(8)',dctmtx(8)');

%Add noise of variance 100 and display the noisy image
noisy_image = image + uint8(randn(size(image))*10);

%Set the parameters for ISTA
% alpha is chosen to be 1.01 times the maximum eigen value
lambda = 25;
no_of_iters = 40;

% Make a zero matrix for the final output image
denoised_image = zeros(size(image));
weights = zeros(size(image));

%tic;

%Loop over all the 8X8 overlapping patches
for i = 1:m-7
    for j = 1:n-7
        
        %Extract the patch to work over on
        patch = noisy_image(i:i+7,j:j+7);  
        y = double(patch(:));
        
        %Applying the ISTA over the patch
        theta_new = ISTA(y,U,lambda, no_of_iters);
        
        %Find the corresponding pixel values and update the image and
        %simultaeously determine the weight matrix
        x_denoised = U*theta_new;
        denoised_image(i:i+7,j:j+7) = denoised_image(i:i+7,j:j+7) + reshape(x_denoised, [8,8]);
        weights(i:i+7,j:j+7) = weights(i:i+7,j:j+7) + ones(8,8);
    end;
end;

output_image = denoised_image./weights;
%toc;

%Display the images
figure;
subplot(2,1,1);
imshow(uint8(noisy_image));
title('Noisy image');

subplot(2,1,2);
imshow(uint8(output_image));
title('Denoised image');


end
