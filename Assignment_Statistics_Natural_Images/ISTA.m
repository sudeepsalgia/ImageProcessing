function [output_theta ] = ISTA(y, A, lambda, no_of_iters)
% Compute the size of the matrix A to determine the dimensionality of
% theta
[m n] = size(A); 
y = double(y);

%Initialize theta using random numbers
theta = rand(n,1);

%Compute the eigen values to determine the value of alpha
[V D] = eigs(A'*A, 5);
alpha = 1.01*max(D(:));


%Initializations
theta_k = double(theta);
theta_updated = double(theta);
% diff_norm = n;
% epsilon = 10^(-10);
% J = [];

% The iterative update till convergence
% convergence = the norm of difference between the new and old values must
% be less than epsilon 

% This implementation assumes that the convegerence will happen within the
% number of iterations the user submits. However the code can be easily
% adapted to have a convergence condition mentioned as above. For the given
% scenario the code has been checked for epsilon = 10^-10 and the
% convergence usually happens in around 30-40 iterations.

for i = 1:no_of_iters
    theta_updated= wthresh(theta_k + (A'*(y-A*theta_k))/alpha, 's', lambda/(2*alpha));
    % diff_norm = norm(theta_updated - theta_k);
    theta_k = theta_updated;  
    % cost = norm(y - A*theta_k, 'fro')^2 + lambda*norm(theta_k,1);
    % cost = sum(abs(y-A*theta_k).^2) + lambda*sum(abs(theta_k));
    % J = [J cost];
end;

%figure; plot(1:no_of_iters, J);
output_theta = theta_updated;


end
