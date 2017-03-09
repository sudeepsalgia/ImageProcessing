function [gradientVal] = getThirdTypeGradient(x, up, down, left, right, gamma)

u1 = x - up;
u2 = x - down;
u3 = x - right;
u4 = x -left;

%Get the gradient if the cost function is the discontinuity adaptive type
gradientVal = (gamma*u1)./(gamma + abs(u1)) + (gamma*u2)./(gamma + abs(u2)) + (gamma*u3)./(gamma + abs(u3)) + (gamma*u4)./(gamma + abs(u4));
gradientVal = gradientVal(:);
end