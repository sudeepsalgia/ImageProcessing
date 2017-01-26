function [ normalizedPointSets ] = hypersphere( pointSets )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

normalizedPointSets = zeros(size(pointSets, 1),size(pointSets, 2),size(pointSets, 3));
for set = 1:size(pointSets, 3),
    normalizedPointSets(1,:,set) = pointSets(1,:,set) - mean(pointSets(1,:,set));
    normalizedPointSets(2,:,set) = pointSets(2,:,set) - mean(pointSets(2,:,set)); 
    normalizedPointSets(:,:,set) = normalizedPointSets(:,:,set)/norm(normalizedPointSets(:,:,set), 'fro');
 end

