function [V_hat, xbar, alpha  ] = faceRecognitionYale( k )

database = load('databaseYale.mat');
x = database.databaseYale;
xbar = mean(x,2);
X = x - repmat(xbar, [1,size(x,2)]);
L = X'*X;
[W, D] = eigs(L,k);
V_hat = X*W;
V_hat = normc(V_hat);
alpha = V_hat'*X;
end

