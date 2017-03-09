function [cost] = computeCost(y, A, psi, x, lambda)
cost = norm(y - A*psi*x, 2)^2 + lambda*norm(x,1);
end