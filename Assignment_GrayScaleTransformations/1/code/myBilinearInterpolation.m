function [ outputImage ] = myBilinearInterpolation( inputImage )
% The function implements the technique of bilinear interpolation on the image passed to it as inputImage
% to give an enlarged image having almost twice as columns and thrice as rows

[M N] = size(inputImage); % Compute the dimension of the image M: number of rows N: number of columns

outputImage = zeros(3*M-2, 2*N-1); % Initialise an image of required final size with zeroes

outputImage(3*[1:M]-2,2*[1:N]-1) = inputImage([1:M],[1:N]); % Fill the pixels with the known data

outputImage(3*[1:M]-2,2*[1:N-1]) = (outputImage(3*[1:M]-2,2*[1:N-1]-1) + outputImage(3*[1:M]-2,2*[1:N-1]+1))*0.5;
% Interpolate along the columns to fill the ones whose values are to be determined.
% Since all such columns will be equidistant from the known ones, the equation effectively
% reduces to taking the average of the neighbouring pixels

outputImage(3*[1:M-1],[1:2*N-1]) = (outputImage(3*[1:M-1]-2,[1:2*N-1]) + 2*outputImage(3*[1:M-1]+1,[1:2*N-1]))/3;
outputImage(3*[1:M-1]-1,[1:2*N-1]) = (2*outputImage(3*[1:M-1]-2,[1:2*N-1]) + outputImage(3*[1:M-1]+1,[1:2*N-1]))/3;
%  Interpolate along the rows to fill the ones whose values are yet to be determined
% Since there are two rows of unknown pixels between every two known ones, clearly the ratio of the 
% distances becomes 2:1 and accordingly the pixels are nultiplied by the weight and the weighted average is
% computed to determine the value of the pixel by linear interpolation

outputImage = uint8(outputImage); % Convert the image to uint8 type

end

