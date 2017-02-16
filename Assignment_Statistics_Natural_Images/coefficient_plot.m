function [] = coefficient_plot(b)
% The function plots an the probability distribution that is obtained
% analytically of the DCT coefficients and also the by numerically solving
% the integral
%
% The function is : 
% 
% y = (x/b)*erfc(x/sqrt(2b)) + (2/sqrt(2*pi*b))*exp(-(x^2)/2b)
%
% This is obtained by integration of the function 
% 
%   y = sqrt(2/pi)*(1/b)*exp(-0.5*(c/x)^2)  
%
% wrt to x from 0 to sqrt(b). Here c is the DCT coefficient F(u,v) whose
% probability density is to be plotted 


% Set a base for which the linear span is to be set
x = -1:0.01:1;

% For the analytical part of the integeral
gauss = (2/sqrt(2*pi*b))*exp(-(x.^2)/(2*b));
error = x.*erfc(abs(x)/sqrt(2*b))/b;
y = (-error.*sign(x) + gauss);

% To solve using function made by us
integ = zeros(size(x));

% To use MATLAB's in built integral solver for the numerical estimate
actual_val = zeros(size(x));
fun = @(t,c) exp(-(0.5)*(c./t).^2);



for j = 1:length(x)
    % Using our function
    integ(j) = eval_integral(x(j),b);
    
    % Using MATLAB's function
    actual_val(j) = integral(@(t)fun(t,x(j)),0,sqrt(b))*(1/b)*sqrt(2/pi);
end;

% Currently the function outputs only the integral evaluated using the
% function that we have written. But the other ones can be uncommented and
% looked and verified
    
% figure; 
% plot(x,y); 
% title('Analytical solution');

figure; 
plot(x,integ);hold on;
title('Our function');

% figure; 
% plot(x,actual_val);
% title('MATLABs function');

% For the best gaussian fit of the data
f = fit(x',y','gauss2');

plot(f,x,y);

% After using this we get the following parameters of the best fit of the
% gaussian curve
% 
%   Mean = -0.0278
%   Standard deviation = 1.331
%



end
