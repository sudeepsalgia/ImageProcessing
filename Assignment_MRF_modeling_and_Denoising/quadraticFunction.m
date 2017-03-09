function [denoised_image] = quadraticFunction(noisy_image, var, alpha)

%Initalise basic variables like the step size intial values for the
%estimated image
step = 0.01;
[m n] = size(noisy_image);
y = noisy_image(:);
x = y;
j = [];
diff = 1;

while diff>0.00001 && step>0.000000001
    % Get neighbourhood matrices
    [up, down, left, right] = getNeighbourhoodMatrices(reshape(x, [m n]));
    
    % Compute the cost for old value of x
    cost_vec = ((1-alpha)*(abs(x-y).^2))/var + alpha*getQuadraticCost(reshape(x, [m n]), up, down, left, right);
    cost = sum(cost_vec);
    
    % Compute the gradient 
    deriv = (2*(1-alpha)*(x-y))/var + alpha*getQuadraticGradient(reshape(x, [m n]), up, down, left, right);
    
    % Update x accordingly
    x = x - step*deriv;
    
    % Update step size for its dynamic variation and find the difference
    % between successive updates
    if ~isempty(j)
        if j(end)>cost
            step = 1.1*step;
        else 
            step = 0.5*step;
        end
        diff = abs(j(end)-cost);
    end
    
    % Make a cost vector
    j = [j cost];
end

%Plot the cost function
figure;
plot(j);
title('Cost function vs No. of iterations');

% Return the denoised image
denoised_image = reshape(x, [m n]);
end