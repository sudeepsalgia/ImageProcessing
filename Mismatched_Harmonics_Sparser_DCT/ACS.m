function [x_ideal, theta_ideal] = ACS(y, A, Q, N)

alpha = 0.1;
beta = 0.1;
TOL = 10e-5;

t = 0;
step_size = 0.01;
num_iters = 50;

theta = zeros(1, Q*N/2);
b = 0;

cost_vec = [];

while (b == 0)
    
    psi_theta = generatePsiMatrix(N, Q, theta);
    H = A*psi_theta;
    lambda = alpha*norm((H'*y),'inf');
        
    
    
    [V D] = eigs(H'*H, 5);
    alpha_ISTA = 1.01*max(D(:));
    x_new = ISTA(y , H, lambda, 40, alpha_ISTA);
    
    kappa = beta*norm(x_new,2);
    setOfIndices = find(abs(x_new) >= kappa);
    for idx = 1:length(setOfIndices)
        [psi_theta theta] = optimisePsi(y, A, x_new, psi_theta, theta, setOfIndices(idx), step_size, num_iters, N, Q);
    end
    
    cost_new = computeCost(y, A, psi_theta,x_new, lambda);
    
    if ~isEmpty(cost_vec)
        if(abs((cost_new - cost_vec(end))/cost_vec(end)) < TOL)
            b = 1;
        end 
    end
    
    cost_vec = [cost_vec cost_new];
    
    t = t+1;
end
end
