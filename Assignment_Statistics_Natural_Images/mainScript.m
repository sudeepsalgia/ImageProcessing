function [] = mainScript()
% This function would just run all the functions for the questions 1 and 2

% This is the first part of question 1 that denoises the image
img = question1a_new() ;

% This is the part which reconstructs the image from a matrix that projects
% patches onto a smaller dimension 
img1 = question1b() ;

% This is the reconstruction of the sparse signal. Two outputs have been
% shown both with one percent and five percent noise additions

% One percent
sig = question1c(1);

% Five percent
sig = question1c(5);

% For the second question the patch variances are plotted and the function
% that is the estimate of the distribution of the DCT coefficients of the
% patches of the image

% This will plot the patch variances
plot_patch_variances();

% This will plot the distribution function of the coefficients and best
% gaussian fit of the system. The value of the paramter is b = 0.18 and has
% been determined from above
coefficient_plot(0.18);


end
