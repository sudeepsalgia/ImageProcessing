function [rms_val] = rmsd_bilateral(A,B)
    [m, n] = size(A);
    A1 = A - min(A(:));
    A1 = A1/ max(A1(:));
    
    B1 = B - min(B(:));
    B1 = B1/max(B1(:));
    diff = A1 - B1;
    diff = diff.^2;
    diff_sum = sum(diff(:));
    diff_avg = diff_sum/(m*n);
    
    rms_val = sqrt(diff_avg);    
end
