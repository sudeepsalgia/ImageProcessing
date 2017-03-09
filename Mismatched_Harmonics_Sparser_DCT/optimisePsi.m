function [psi_new, theta] = optimisePsi(y, A, x, psi_init, theta, k, step_size, num_iters, N, Q)

psi_new = psi_init;
for p = 1:num_iters
    psi_prime = psi_new;
    psi_prime(:,[k (Q*N/2 + k)]) = psi_prime(:,[(Q*N/2 + k) k]); %% Need to be checked if the update equation gets changed
    % Minor sa hi change hoga
    
    derivPsi = 2*(-y'*A*psi_prime*x + x'*psi_prime'*A'*A*psi_prime*x);
    theta(k) = theta(k) - step_size*derivPsi;
    psi_new = generatePsiMatrix(N, Q, theta);
end
    

end