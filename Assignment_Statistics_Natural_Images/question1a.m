function [output_image] = question1a_nonoverlap()

%Read the image 
image = imread('barbara256.png');

%Construct the DCT basis matrix for 8X8 patches
U = kron(dctmtx(8)',dctmtx(8)');

%Add noise of variance 100 and display the noisy image
noisy_image = image + uint8(randn(size(image))*10);
figure; imshow(noisy_image);

%Set the parameters for ISTA
% alpha is chosen to be 1.01 times the maximum eigen value
lambda = 12;

% Make a zero matrix for the final output image
denoised_image = zeros(size(image));

%Loop over all the 1024 8X8 patches
for i = 1:32
    for j = 1:32
        %Extract the patch to work over on
        patch = noisy_image(8*(i-1)+1:8*i,8*(j-1)+1:8*j);  
        y = double(patch(:));
        
        %Applying the ISTA over the patch
        theta_new = ISTA(y,U,lambda);
        
        %Find the corresponding pixel values and update the image
        x_denoised = U*theta_new;
        denoised_image(8*(i-1)+1:8*i,8*(j-1)+1:8*j) = denoised_image(8*(i-1)+1:8*i,8*(j-1)+1:8*j) + reshape(x_denoised, [8,8]);
    end;
end;

output_image = denoised_image;
end
