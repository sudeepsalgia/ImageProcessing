function [integral] = eval_integral(Fuv, b)

Nsteps = floor(sqrt(b)/0.001);
x = 0:0.001:0.001*Nsteps;
y = x*sqrt(2)/Fuv;
z = exp(-y.^(-2));
c = sqrt(2/pi)/b;

integral = sum(z)*0.001*c;
end
