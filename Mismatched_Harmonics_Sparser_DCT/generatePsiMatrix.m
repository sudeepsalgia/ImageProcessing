function [psi] = generatePsiMatrix(N, Q, theta)

baseRowLeft = (0 : ((Q*N/2)-1))/(Q*N) + theta;
matRowLeft = repmat(baseRowLeft, [N,1]);
baseRowRight = (N - (((Q*N/2)+1) : (Q*N)))/(Q*N) - theta;
matRowRight = repmat(baseRowRight, [N,1]);
baseColumns = 2*pi*[0:N-1]';
matCol = repmat(baseColumns, [1 , (Q*N/2)]);

psi = sqrt(2/N)*[cos(matCol.*matRowLeft) , -sin(matCol.*matRowRight)];
end