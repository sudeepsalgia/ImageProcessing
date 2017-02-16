function [s, T] = OMP(y,A,eps)

%Initialise the variables
r = y;
s = 0;
T = [];
l = 0;
epsilon = eps;
normA = normc(A); % gives the matrix A with all its columns normalised

% Implementation of the OMP algorithm
while(norm(r)^2 > epsilon)
    [~, k] = max(abs(r'*normA));
    
    %Update the support set 
    T = [T k]; 
    A_T = A(:,T);
    
    %Find the corresponding coefficient
    s = pinv(A_T)*y;
    
    %Update r and l
    r = y - A_T*s;
    l = l+1;   
end 

end