function [ intValue ] = myIntegration( imageXY, t, theta, ds )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s = 0;
Xnew = t*cosd(theta);
Ynew = t*sind(theta);
Xcumulative = [];
Ycumulative = [];

while ((Xnew > -(size(imageXY,1) - 1)/2 + 2) && (Ynew > -(size(imageXY,2) - 1)/2 + 2) && (Xnew < (size(imageXY,1)/2) - 2) && (Ynew < (size(imageXY,2)/2) - 2)),    
    Xcumulative = [Xcumulative, Xnew]; 
    Ycumulative = [Ycumulative, Ynew];
    s = s + ds;
    Xnew = t*cosd(theta) - s*sind(theta);
    Ynew = s*cosd(theta) + t*sind(theta);
end;

s = -ds;
Xnew = t*cosd(theta) - s*sind(theta);
Ynew = s*cosd(theta) + t*sind(theta);
while ((Xnew > -(size(imageXY,1) - 1)/2 + 2) && (Ynew > -(size(imageXY,2) - 1)/2 + 2) && (Xnew < (size(imageXY,1)/2) - 2) && (Ynew < (size(imageXY,2)/2) - 2)),    
    Xcumulative = [Xcumulative, Xnew]; 
    Ycumulative = [Ycumulative, Ynew];
    s = s - ds;
    Xnew = t*cosd(theta) - s*sind(theta);
    Ynew = s*cosd(theta) + t*sind(theta);
end;

Xcumulative = Xcumulative + size(imageXY , 1)/2;
Ycumulative = Ycumulative + size(imageXY , 2)/2;

XYvalues = interp2( imageXY, Xcumulative , Ycumulative);
intValue = sum(XYvalues);

if(isnan(intValue)),
    disp('ty');
end;
end

