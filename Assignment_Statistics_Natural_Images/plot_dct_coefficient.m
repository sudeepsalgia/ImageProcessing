function [] = plot_dct_coefficient(u,v)
% The function plots the DCT coefficients of the frequency pair (u,v)
% The coefficients have been drawn from the images d5 and d6

coeffs = dct_coefficients;

%Compute the index
index = u + 8*v - 8 ; % = (u-1) + 8*(v-1) + 1;

figure;
hist(coeffs(index,:), 30);
end