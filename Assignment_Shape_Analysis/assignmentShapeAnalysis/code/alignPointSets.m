function [ alignedPointSet ] = alignPointSets( z , pointSet , numOfPointSets)
%ALIGNPOINTSETS Summary of this function goes here
%   Detailed explanation goes here

alignedPointSet = zeros(size(pointSet)); 
for i = 1 : numOfPointSets,
    alignedPointSet(:,:,i) = align2PointSet(z , pointSet(:,:,i));
%    disp(i);
%    disp(alignedPointSet(:,:,i));
end

