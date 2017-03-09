function [cost] = getThirdTypeCost(x, up, down, left, right, gamma)

%Get the cost according to discontinuity adaptive function
u1 = x - up;
u2 = x - down;
u3 = x - right;
u4 = x -left;

cost = gamma*abs(u1) - (gamma^2)*log(1+abs(u1)/gamma);
cost = cost + gamma*abs(u2) - (gamma^2)*log(1+abs(u2)/gamma);
cost = cost + gamma*abs(u3) - (gamma^2)*log(1+abs(u3)/gamma);
cost = cost + gamma*abs(u4) - (gamma^2)*log(1+abs(u4)/gamma);
cost = cost(:);
end