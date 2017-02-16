function [error] = RMSE(img1, img2)
img1 = double(img1);
img2 = double(img2);
img1_norm = img1 - min(img1(:));
img1_norm = img1/max(img1(:));

img2_norm = img2 - min(img2(:));
img2_norm = img2/max(img2(:));

[m n] = size(img1);

error = sqrt(sum(sum((img1_norm - img2_norm).^2))/(m*n));
end