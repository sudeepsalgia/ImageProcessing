
load(fullfile('..', 'data', 'ellipses2D.mat'));

%Raw DataSets
col = hsv(numOfPointSets);
figure;
hold on;
for set = 1:numOfPointSets,
plot(pointSets(1,:,set) , pointSets(2,:,set) , 'Color' , col(set,:)); 
end
hold off;

%DataSets on HyperSphere
normalizedPointSets = hypersphere(pointSets);
figure;
hold on;

for set = 1:numOfPointSets,
plot(normalizedPointSets(1,:,set) , normalizedPointSets(2,:,set) , 'Color' , col(set,:)); 
end
hold off;

%Testing Aligning of PointSet
%distInitial = norm(normalizedPointSets(:,:,1) - normalizedPointSets(:,:,2), 'fro');
%disp(distInitial);
%alignTest = align2PointSet(normalizedPointSets(:,:,1) , normalizedPointSets(:,:,2));
%distFinal = norm(normalizedPointSets(:,:,1) - alignTest, 'fro');
%disp(distFinal);
%figure;
%hold on;
%plot(normalizedPointSets(1,:,1) , normalizedPointSets(2,:,1) , 'Color' , col(1,:)); 
%plot(normalizedPointSets(1,:,2) , normalizedPointSets(2,:,2) , 'Color' , col(5,:));
%plot(alignTest(1,:) , alignTest(2,:) , 'Color' , col(9,:));
%hold off;

%Finding Mean
[z, newNormalizedPointSets] = findMean(normalizedPointSets , numOfPointSets);



%Finding Variance
reshapedNormalizedPointSets = zeros(numOfPoints*size(pointSets,1) , 1 , numOfPointSets); 
for p = 1:numOfPointSets,
    reshapedNormalizedPointSets(:,:,p) = reshape(newNormalizedPointSets(:,:,p) , numOfPoints*size(pointSets,1) , 1);
end;
zHorizontal = reshape(z ,  numOfPoints*size(pointSets,1) , 1);
%meanNormalizedPoints = bsxfun(@minus , reshapedNormalizedPointSets , zHorizontal);
meanNormalizedPoints = reshapedNormalizedPointSets;
covMatrix = zeros(numOfPoints*size(pointSets,1),numOfPoints*size(pointSets,1));
for i = 1 : numOfPointSets,
    covMatrix = covMatrix + meanNormalizedPoints(:,:,i)*meanNormalizedPoints(:,:,i)';
end;
disp(size(covMatrix));
covMatrix = covMatrix/(numOfPointSets-1);

[V , D] = eigs(covMatrix , 2);
mode1 = reshape(V(:,1)' , size(pointSets,1) , numOfPoints);
plot(mode1(1,:), mode1(2,:) , 'Color' , [1, 0 , 0] , 'LineWidth' , 3);
%mode1 = mode1 + z; 
%plot(mode1(2,:), mode1(1,:) , 'Color' , [1, 0, 0] , 'LineWidth' , 3);


