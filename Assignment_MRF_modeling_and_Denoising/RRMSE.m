function [error] = RRMSE(img1, img2)
%Computes the relative root mean squared error of img2 with img1

error = norm(abs(img1) - abs(img2), 'fro')/norm(abs(img1), 'fro');


end