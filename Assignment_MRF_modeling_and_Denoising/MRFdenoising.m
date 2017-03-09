function [] = MRFdenoising()

load('assignmentImageDenoisingPhantom.mat');
%Report the initial relative root mean squared error
RRMSE_init = RRMSE(imageNoiseless, imageNoisy);
disp(RRMSE_init);
% RRMSE_init = 0.2986

%Report the optimal values of the parameters and RRMSE

% For the Quadratic Function

% alpha* = 
% RRMSE(alpha*) = 
% RRMSE(1.2alpha*) = 
% RRMSE(0.8alpha*) = 

% For the Discontinuity adaptive Huber Function

% alpha* = 
% gamma* = 
% RRMSE(alpha*,gamma*) = 
% RRMSE(1.2alpha*,gamma*) = 
% RRMSE(0.8alpha*,gamma*) = 
% RRMSE(alpha*,1.2gamma*) = 
% RRMSE(alpha*,0.8gamma*) = 

% For the Discontinuity Adaptive Function
    
% alpha* = 
% gamma* = 
% RRMSE(alpha*,gamma*) = 
% RRMSE(1.2alpha*,gamma*) = 
% RRMSE(0.8alpha*,gamma*) = 
% RRMSE(alpha*,1.2gamma*) = 
% RRMSE(alpha*,0.8gamma*) = 

%Report the images
figure;
imshow(imageNoiseless);
title('Noiseless image');
colormap(gca,hot), colorbar;

figure;
imshow(real(imageNoisy));
title('Noisy image');
colormap(gca,hot), colorbar;

% Image Denoised using the Quadratic Function
% Set the optimal value of parameters
alpha_quad_opt = 0.85;
denoised_image = quadraticFunction(imageNoisy,1, alpha_quad_opt);
RRMSE_quad = RRMSE(imageNoiseless, denoised_image);
disp(RRMSE_quad);
figure;
imshow(real(denoised_image));
colormap(gca,hot), colorbar
title('Quadratic prior');


% Image Denoised using the Huber Function
% Set the optimal value of parameters
alpha_huber_opt = 0.85;
gamma_huber_opt = 100;
denoised_image = HuberFunction(imageNoisy,1, alpha_huber_opt, gamma_huber_opt);
RRMSE_huber = RRMSE(imageNoiseless, denoised_image);
disp(RRMSE_huber);
figure;
imshow(real(denoised_image));
colormap(gca,hot), colorbar
title('Huber prior');


% Image Denoised using the Discontinuity Adaptive Function
% Set the optimal value of parameters
alpha_thirdType_opt = 0.85;
gamma_thirdType_opt = 100;
denoised_image = ThirdTypeFunction(imageNoisy,1, alpha_thirdType_opt, gamma_thirdType_opt);
RRMSE_thirdType = RRMSE(imageNoiseless, denoised_image);
disp(RRMSE_thirdType);
figure;
imshow(real(denoised_image));
colormap(gca,hot), colorbar
title('Discontinuity Adaptive prior');


end