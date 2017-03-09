function [gradientVal] = getQuadraticGradient(x, up, down, left, right)

% The gradient when the cost function is quadratic
gradientVal = 2*(4*x - up- down - left - right);
gradientVal = gradientVal(:);
end