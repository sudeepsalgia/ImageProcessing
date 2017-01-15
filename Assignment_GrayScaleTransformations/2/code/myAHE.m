function [ outputImage ] = myAHE( inputImage, N )
% The function is used to perform Adaptive Histogram equalization on an image passed as inputImage 
% using a window size of N  (default assumed to be an odd number). The method uses two custom
% defined functions myHE (which is our implementation of histogram equalisation) and 
% getNeighbourhoodWindow which is used to get a submatrix with (i.j) as center and size NxN

[m n] = size(inputImage); % determine the number of rows(m) and columns(n) in the image

if mod(N,2) == 0
    N = N + 1;
end
outputImage = zeros(m,n);

tic % begin the time
for i = 1:m  % a loop to go through all the rows
    for j = 1:n % a loop to go throuogh all the columns
       
        tempImg = getNeighbourhoodWindow(inputImage, i, j, N); % get the required submatrix on which histogram equalisation is to be applied  
        
        tempOut = myHE(tempImg+1); % apply histogram equalisation on the window (+1 to avoid any corner cases)
        
        index = [min(i,(N+1)/2), min(j,(N+1)/2)]; % determine the index of the center pixel in the new submatrix 
        % The above statement is necessary because it is not always the size of the obtained window iss NxN because of the pixels near the 
        % edge. Hence this is to be determined for every pixel
        
        outputImage(i,j) = tempOut(index(1), index(2)); % replace the new value of the pixel
    end
end
% outputImage = inputImage; % move the image into the output variable
outputImage = uint8(outputImage);

toc % end time

end

