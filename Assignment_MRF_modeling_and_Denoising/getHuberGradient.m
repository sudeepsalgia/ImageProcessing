function [gradientVal] = getHuberGradient(x, up, down, left, right, gamma)

u1 = x - up;
u2 = x - down;
u3 = x - right;
u4 = x -left;

u1_logical = abs(u1) <= gamma;
u2_logical = abs(u2) <= gamma;
u3_logical = abs(u3) <= gamma;
u4_logical = abs(u4) <= gamma;

%Get the gradient when the cost the cost function is the Huber function
gradientVal = u1.*u1_logical + (gamma*sign(u1)).*(~u1_logical) + u2.*u2_logical + (gamma*sign(u2)).*(~u2_logical);
gradientVal = gradientVal + u3.*u3_logical + (gamma*sign(u3)).*(~u3_logical) +u4.*u4_logical + (gamma*sign(u4)).*(~u4_logical);
gradientVal = gradientVal(:);
end