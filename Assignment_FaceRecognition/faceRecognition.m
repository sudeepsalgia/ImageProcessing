function [V_hat, xbar, alpha  ] = faceRecognition( k )

database = load('database.mat');
x = database.database;
xbar = mean(x,2);
X = x - repmat(xbar, [1,size(x,2)]);

L = X'*X;


[W, D] = eig(L);
%disp(diag(D));
V = X*W;
V = normc(V);

n_eigenvectors = size(V,2);

V_hat = V(:,n_eigenvectors-k+1:end);
%for i = 1:size(V_hat,2)
%    k = reshape(V(:,i),[112,92]);
%    figure,imshow(k, [min(V(:,i)),max(V(:,i))]);
%end
%disp(size(V_hat));
alpha = V_hat'*X;








end

