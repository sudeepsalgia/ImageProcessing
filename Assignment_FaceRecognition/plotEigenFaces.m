function [  ] = plotEigenFaces(  )
[V_hat, xbar, alpha] = faceRecognitionYale(25);
for i = 1:25
img = V_hat(:,i);
img = reshape(img, [192 168]);
subplot(5,5,i)
imshow(img, [min(img(:)), max(img(:))]);
title(strcat('k =', num2str(i)));
end

