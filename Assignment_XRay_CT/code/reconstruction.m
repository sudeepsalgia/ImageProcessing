function [ Rerr, minima, I, Rrec ] = reconstruction( imageAC, pixel )
%RECONSTRUCTION Summary of this function goes here
%   Detailed explanation goes here

thetaVec = 0:1:179;

figure;
imshow(imageAC);

grey = mat2gray(imageAC);
figure;
imshow(grey);

theta = zeros(size(1,180));
Rerr  = zeros(size(1,180));

for i = 1:179,
    if(i + 149 > 180)
        theta = horzcat( thetaVec(i:end) , thetaVec(1 : mod(i+149,180)) );
    else
        theta = thetaVec(i:i+149);
    end
    [R t] = radon(imageAC, theta);
    
    Rrec  = iradon(R , theta, 'linear', pixel);
    Rerr(i) = norm((Rrec - imageAC), 'fro')/norm(imageAC, 'fro');
end;

[minima I] = min(Rerr);


if(I + 149 > 180)
    theta = horzcat( thetaVec(I:end) , thetaVec(1 : mod(I+149,180)) );
else
    theta = thetaVec(I:I+149);
end
[R t] = radon(imageAC, theta);
    
Rrec  = iradon(R , theta, 'linear', pixel);
end

