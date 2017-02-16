function [output_image] = OMPbarbara()

%Read the image 
image = imread('barbara64.jpg');
[m n] = size(image);

%Construct the DCT basis matrix for 8X8 patches
U = kron(dctmtx(8)',dctmtx(8)');

%Construct the phi matrix. Note this will be different each time you
%execute this code.
phi = randn(32,64);

%Set the parameters for ISTA
% alpha is chosen to be 1.01 times the maximum eigen value
lambda = 200 ;
no_of_iters = 40;

% Make a zero matrix for the final output image
denoised_image = zeros(size(image));
weights = zeros(size(image));

tic;
%Loop over all the 8X8 patches
for i = 1:m-7
    %disp(i);
    for j = 1:n-7
       
        %Extract the patch to work over on
        patch = image(i:i+7,j:j+7);  
        x_old = double(patch(:));
        y = phi*x_old;
        
        %Determine the A matrix
        A = phi*U;
        
        %Applying the ISTA over the patch
        %theta_new = ISTA(y,A,lambda, no_of_iters);
        [s T] = OMP(y,A);
        theta_new = zeros(64,1);
        theta_new(T) = s;
        
        %Find the corresponding pixel values and update the image and
        %simultaneously find the weights for each pixel
        x_denoised = U*theta_new;
        denoised_image(i:i+7,j:j+7) = denoised_image(i:i+7,j:j+7) + reshape(x_denoised, [8,8]);
        weights(i:i+7,j:j+7) = weights(i:i+7,j:j+7) + ones(8,8);
        
    end;
end;


        
%weights = ones(64,64);
output_image = denoised_image./weights;
toc;

% Display the output image
figure;
imshow(uint8(output_image));
title('Reconstructed image from question 1b');

figure;
imshow(uint8(image));
title('Original image');

disp(sqrt(sum(sum((output_image-double(image)).^2))/(m*n)));


end
