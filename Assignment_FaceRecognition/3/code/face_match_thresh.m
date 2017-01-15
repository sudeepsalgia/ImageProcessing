function [ false_positives, false_negatives ] = face_match_thresh(k )
    %false positive -> should not match with the database, yet incorrectly 
    %matching
    %false negative -> is present in the database, but not being correctly
    %predicted
test = load('testset.mat');
testset = test.testset;

test_nomatch = load('test_unmatch.mat');
test_unmatch = test_nomatch.test_unmatch;


[V_hat, xbar, alpha, thresh] = face_match_recog(k);
%z = testset-repmat(xbar, [1, size(testset,2)]);
% alpha = normc(alpha);
z = test_unmatch - repmat(xbar, [1, size(test_unmatch,2)]);

% thresh = 50;
l = size(alpha,2);
%disp(size(alpha));
false_positives = 0;

beta = V_hat'*z;
beta = normc(beta);

for i = 1: size(beta,2)
    diff = alpha - repmat(beta(:,i),[1,l]);
    distances = sum(diff.^2,1);
    %disp(min(distances));
    j = find(distances == min(distances));
    min_dist = min(distances);
%     disp(j);
%     if (floor((i-1)/4) == floor((j-1)/6))
%         count = count+1;
%     end
    if (min_dist < thresh)
        false_positives = false_positives + 1;
    end
    
end


z = testset - repmat(xbar, [1, size(testset,2)]);

l = size(alpha,2);
%disp(size(alpha));
false_negatives = 0;

beta = V_hat'*z;
beta = normc(beta);

for i = 1: size(beta,2)
    diff = alpha - repmat(beta(:,i),[1,l]);
    distances = sum(diff.^2,1);
    %disp(min(distances));
    j = find(distances == min(distances));
    min_dist = min(distances);
%     disp(j);
    if (floor((i-1)/4) == floor((j-1)/6))
        %count = count+1;
        if (min_dist > thresh)
            false_negatives = false_negatives + 1;
        end
    else
%         false_negatives = false_negatives + 1;
    end
    

    
end



end

