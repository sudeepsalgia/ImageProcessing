function [neighbourhoodWindow] = getNeighbourhoodWindow(image, i ,j, WindowSize)
% This function is used to get a window centered at (i.j) from an image passed as image
% The window is default taken to be square of windowSize which is default assumed to be odd
% to justify theclaim of existence of a center pixel

area = size(image);% Compute the dimensions of the image

length = (WindowSize - 1)/2;% Calculate the number of pixels on either side of the center pixel

neighbourhoodWindow = image( max(1,i - length) : min(area(1),i + length) , max(1,j - length) : min(area(2),j + length) );
% This clips the required submatrix taking care of the corner cases where the indices may go out of bound
% Hence any non positive index is changed to be 1 and the if it exceeds the total number of pixels in one dimension 
% the number is the taken to the maximum along that dimension 

end
