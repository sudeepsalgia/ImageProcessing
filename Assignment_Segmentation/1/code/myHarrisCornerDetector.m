function [points, R, Ix, Iy, E1, E2] = myHarrisCornerDetector(inp_img1)
    inp_img = double(inp_img1)/255;
    [m,n] = size(inp_img);
    %%
    sigma = 1;
    k = 0.04;
    threshold = 1;
    
    Gxy = fspecial('gaussian', max(1, fix(6*sigma)), sigma);
% Gxy = ones(3);
    
    %%
    dx = [-1 0 1; -2 0 2; -1 0 1];
    dy = dx';
    Ix = conv2(inp_img, dx, 'same');
    Iy = conv2(inp_img, dy, 'same');
    
    Ix2 = Ix.^2;
    Iy2 = Iy.^2;
    Ixy = Ix.* Iy;
        
    Sx2 = conv2(Ix2, Gxy, 'same');
    Sy2 = conv2(Iy2, Gxy, 'same');
    Sxy = conv2(Ixy, Gxy, 'same');
    %%
    R = zeros(m,n);
    E1 = zeros(m,n);
    E2 = zeros(m,n);
    tp = [1,1];
    points = [tp];
    for i=1:m
        for j=1:n
            A = [Sx2(i,j), Sxy(i,j); Sxy(i,j) , Sy2(i,j)];
            eig_vals = eig(A);
            E1(i,j) = eig_vals(1);
            E2(i,j) = eig_vals(2);
            R(i,j) = det(A) - k*(trace(A) ^2);
            
            if (R(i,j) > threshold)
                p = [i,j];
                points = [points;p];
            end
            
        end
    end      
    %%
    points = points';
    figure; imshow(inp_img);
    hold on;
    plot(points(2,:),m - points(1,:), 'go');
    hold off;
    
    
    
end
