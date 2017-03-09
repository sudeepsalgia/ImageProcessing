function [cost] = getQuadraticCost(x, up, down, left, right)

% Cost for the quadratic function
cost = abs(x-up).^2 + abs(x-down).^2 + abs(x-right).^2 +abs(x-left).^2;
cost = cost(:);
end