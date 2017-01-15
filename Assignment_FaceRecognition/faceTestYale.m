function [ count ] = faceTestYale(k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
test = load('testsetYale.mat');
testset = test.testcaseYale;
[V_hat, xbar, alpha] = faceRecognitionYale(k);
z = testset-repmat(xbar, [1, size(testset,2)]);

l = size(alpha,2);
count = 0;
beta = V_hat'*z;
for i = 1: size(beta,2)
    diff = alpha - repmat(beta(:,i),[1,l]);
    if (k>3)
    diff(1:3,:) = 0;
    end 
    distances = sum(diff.^2,1);
    %disp(min(distances));
    j = find(distances == min(distances));
   % disp(j);
    if (floor((i-1)/20) == floor((j-1)/40))
        count = count+1;
    end
end


end

