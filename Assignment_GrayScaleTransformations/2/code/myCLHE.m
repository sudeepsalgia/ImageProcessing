function [ out_img ] = myCLHE( inputImage, h )
% This function is used to perform a global Contrast limited Adaptive Histogram equalisation
% on an image passed as inputImage. The histogram threshold parameter 'h' is passed to the 
% function by the user to control the contrasst level required in the equalisation 

    inp_hist = imhist(inputImage); % get the histogram of the image 
    
    inp_hist = double(inp_hist); % convert to double
    
    [m n] = size(inputImage(:)); % get the size of the image ; m would the total number of pixels
    % and n would be 1 since image is passed as a vector
    
    inp_hist = inp_hist / m;    %get the pdf(r)
    
    mask = inp_hist>h; % This computes all the numbers which are greater than the threshold 
    % and creates a logical vector with a high for the numbers greater than the 
    % parameter h
    
    new_inp_hist = inp_hist.*(~mask) + mask.*h; % This makes a new histogram by clipping all the
    % the values above h to h. This is achieved by first putting all these numbers to 0 
    % by using ~mask and then adding h to places at these values using mask.*h
    
    reducedMass = 1 - sum(new_inp_hist); % This is used to compute the mass of the function
    % that has been clipped off by taking the mass available and them subtracting it from 1
    
    inp_hist_clahe = new_inp_hist + reducedMass/256; % Uniformly adding the reduced mass to the histogram
    
    T = cumsum(inp_hist_clahe); % creating a cumulative sum of the pdf to make a cdf
    
    out_img = T(inputImage+1); % using the nely obtained cdf to equalise the image
    
    out_img = uint8(out_img * 255);   % scaling the cdf to the desired colormap having 255 intensities
end

