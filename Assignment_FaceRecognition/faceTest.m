function [ count ] = faceTest(k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
test = load('testset.mat');
testset = test.testset;

[V_hat, xbar, alpha] = faceRecognition(k);
z = testset-repmat(xbar, [1, size(testset,2)]);


l = size(alpha,2);
%disp(size(alpha));
count = 0;

beta = V_hat'*z;
for i = 1: size(beta,2)
    diff = alpha - repmat(beta(:,i),[1,l]);
    distances = sum(diff.^2,1);
    %disp(min(distances));
    j = find(distances == min(distances));
    disp(j);
    if (floor((i-1)/4) == floor((j-1)/6))
        count = count+1;
    end
end


end

