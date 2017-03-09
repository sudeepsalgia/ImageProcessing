function [cost] = getHuberCost(x, up, down, left, right, gamma)

u1 = x - up;
u2 = x - down;
u3 = x - right;
u4 = x -left;

u1_logical = abs(u1) <= gamma;
u2_logical = abs(u2) <= gamma;
u3_logical = abs(u3) <= gamma;
u4_logical = abs(u4) <= gamma;

% Get the cost when the function is the Huber cost
cost = (0.5*abs(u1).^2).*u1_logical + (gamma*abs(u1) - (gamma^2)/2).*(~u1_logical);
cost = cost + (0.5*abs(u2).^2).*u2_logical + (gamma*abs(u2) - (gamma^2)/2).*(~u2_logical);
cost = cost + (0.5*abs(u3).^2).*u3_logical + (gamma*abs(u3) - (gamma^2)/2).*(~u3_logical);
cost = cost + (0.5*abs(u4).^2).*u4_logical + (gamma*abs(u4) - (gamma^2)/2).*(~u4_logical);
cost = cost(:);
end
