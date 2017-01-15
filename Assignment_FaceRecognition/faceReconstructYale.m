function [  ] = faceReconstructYale( face_no )
k = [ 2 10 20 50 75 100 125 150 175];
figure;
for i = 1:length(k)
[ V_hat xbar alpha] = faceRecognitionYale(k(i));
img = V_hat*alpha(:,face_no);
img = reshape(img, [192 168]);
subplot(3,3,i)
imshow(img);
title(strcat('k =', num2str(k(i))));

end


end

