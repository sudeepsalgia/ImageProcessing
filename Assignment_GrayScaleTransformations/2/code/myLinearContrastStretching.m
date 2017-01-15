function [y] = myLinearContrastStretching(x, a, b, c, d)
    % piece wise linear curve which passess through the following points:
    	% 90,0) , (a, b) , (c, d) , (255, 255)
    y = x;
    x1 = (x > 0) & (x < a);
    y(x1) = b/a * x(x1);
    x2 = (x >= a) & (x<=c);
    y(x2) = (d-b)/(c-a) * (x(x2) -a) + b;
    x3 = (x > c) & (x <= 255);
    y(x3) = (255-d)/(255-c) * (x(x3) -c) + d;
    y = uint8(y);
    
end