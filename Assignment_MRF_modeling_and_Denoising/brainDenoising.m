function [] = brainDenoising()

load('assignmentImageDenoisingBrainNoisy.mat');

% Estimate the variance
var = estimateNoiseVariance(imageNoisy(1:50, 1:50));
disp(var)


figure;
imshow(real(imageNoisy));
title('Noisy image');
colormap(gca,hot), colorbar;

% Image Denoised using the Quadratic Function
% Set the optimal value of parameters
alpha_quad_opt = 0.99;
denoised_image = quadraticFunction(imageNoisy,var, alpha_quad_opt);
figure;
imshow(real(denoised_image));
colormap(gca,hot), colorbar
title('Quadratic prior');


% Image Denoised using the Huber Function
% Set the optimal value of parameters
alpha_huber_opt = 0.01;
gamma_huber_opt = 10;
denoised_image = HuberFunction(imageNoisy,var, alpha_huber_opt, gamma_huber_opt);
figure;
imshow(real(denoised_image));
colormap(gca,hot), colorbar
title('Huber prior');


% Image Denoised using the Discontinuity Adaptive Function
% Set the optimal value of parameters
alpha_thirdType_opt = 0.01;
gamma_thirdType_opt = 10;
denoised_image = ThirdTypeFunction(imageNoisy,var, alpha_thirdType_opt, gamma_thirdType_opt);
colormap(gca,hot), colorbar
title('Discontinuity Adaptive prior');

end