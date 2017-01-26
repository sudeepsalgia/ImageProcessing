function [ alignedPointSet ] = align2PointSet( z , pointSet )
%ALIGN2POINTSET Summary of this function goes here
%   Detailed explanation goes here

%disp('z');
%disp(z);
%disp('PointSet')
%disp(pointSet);
[U, S, V] = svd(pointSet*z');
%disp(S);
M1 = [1 0 ; 0 -1];
M2 = [-1 0 ; 0 1];
M3 = [-1 0 ; 0 -1];

R = zeros(size(V*U'));

%disp(det(V*U'));
%disp(det(V*M1*U'));
%disp(det(V*M2*U'));
%disp(det(V*M3*U'));
if( round(det(V*U')) == 1),
    R = V*U';

else if(round(det(V*M1*U')) == 1),
    R = V*M1*U';
    
    else if(round(det(V*M2*U')) == 1),
    R = V*M2*U';
        
        else if(round(det(V*M3*U')) == 1),
        R = V*M3*U';
        
            end
        end
    end
end

%disp(R);
alignedPointSet = R*pointSet;  
end


                