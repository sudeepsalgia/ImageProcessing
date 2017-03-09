function [var] = estimateNoiseVariance(patch)

[m n] = size(patch);
var = sum(sum(abs(patch).^2))/(m*n);
end
