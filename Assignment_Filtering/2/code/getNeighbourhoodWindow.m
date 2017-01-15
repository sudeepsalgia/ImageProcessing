function [neighbourhoodWindow] = getNeighbourhoodWindow(image, i ,j, WindowSize)
area = size(image);
length = (WindowSize - 1)/2;
neighbourhoodWindow = image( max(1,i - length) : min(area(1),i + length) , max(1,j - length) : min(area(2),j + length) );
end