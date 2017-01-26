function [ z, newNormalizedPointSets ] = findMean( normalizedPointSets, numOfPointSets )
%FINDMEAN Summary of this function goes here
%   Detailed explanation goes here

newNormalizedPointSets = normalizedPointSets;

for iter = 1:5,
    %Find Mean and Scale
    z = sum(newNormalizedPointSets,3)/numOfPointSets;
    z = z/norm(z,'fro');
  %  disp('z');
  %  disp(z);
    %Find Rotations
    itNormalizedPointSets = newNormalizedPointSets;
    size(itNormalizedPointSets);
    newNormalizedPointSets = alignPointSets(z , itNormalizedPointSets, numOfPointSets);
end

z = sum(newNormalizedPointSets,3)/numOfPointSets;
z = z/norm(z,'fro');

col = hsv(numOfPointSets);
figure;
hold on;
for set = 1:numOfPointSets,
plot(newNormalizedPointSets(1,:,set) , newNormalizedPointSets(2,:,set) , 'Color' , col(set,:)); 
end
plot(z(1,:), z(2,:) , 'Color' , [0, 0, 0] , 'LineWidth' , 3);

