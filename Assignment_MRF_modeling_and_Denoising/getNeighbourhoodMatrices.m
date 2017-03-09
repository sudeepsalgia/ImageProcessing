function [up, down, left, right] = getNeighbourhoodMatrices(x)
% up, down, left and right are the corresponding neighbour matrices of the
% the input matrix x

up = circshift(x,1,1);
down = circshift(x,-1,1);
left = circshift(x,1,2);
right = circshift(x,-1,2);

end