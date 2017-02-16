function [output_signal] = question1c(noise_magnitude)
% The function takes in a parameter which determines the magnitude
% of the noise relative to the norm of the input signal. It is expressed in
% percentage. A 5% percent noise would mean noise_magnitude = 5 and not
% 0.05.

%The convolution kernel
h = [1 2 3 4 3 2 1]/16;
m = 7;% Length of the kernel

n = 100; %Dimension of x
s = 10; % Sparsity of x

%Determine the convolution matrix
H = convmtx(h', n);

%Create a s-sparse n-d random vector
x = zeros(n,1);
indxs = randi([1 100], s,1);
values = rand(10, 1);
x(indxs) = values;

%For the noise signal
noise = randn(n+m-1,1)*noise_magnitude*norm(x,'fro')/100;
y = H*x + noise;

% Set the parameters for ISTA
lambda = 0.1;
no_of_iters = 200;

% Estimate the x using ISTA
x_estimated = ISTA(y,H,lambda,no_of_iters);

output_signal = x_estimated;

%Plot the signals
figure; 

subplot(1,2,1);
stem(x);
title('Original signal');

subplot(1,2,2);
stem(x_estimated);
title('Reconstructed signal');

figure;
stem(y);
title('Noisy signal');


    

end
