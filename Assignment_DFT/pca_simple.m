function [out_img] = pca_simple(inp_img1)
%     patch_s = 7;
%     [m2,n2] = size(inp_img1);
%     half_p = (patch_s - 1)/2;
%     sigma = 20;
%     inp_img = inp_img1 + uint8(randn(size(inp_img1))*sigma);
%     inp_img = double(inp_img);
%     inp_img = padarray(inp_img, [half_p,half_p]);
%     [m,n] = size(inp_img);
    P =[];
    half_p = 3;
    [m n] = size(inp_img1);
    for i = half_p + 1:m - half_p
        for j = half_p + 1:n-half_p 
            p = getNeighbourhoodWindow(inp_img1, i, j, 7);
            p = p(:);
            P = [P p];
        end
    end
    P = double(P);
    [V, ~] = eig(P*P');
    [m1,n1] = size(P);
    alpha = V' * P;
   % alpha1 = alpha.^2;
    %alpha_s = max(0,sum(alpha1,2)/n1 - sigma^2);
    %coeff = alpha_s./(sigma^2 + alpha_s);
    %coeff = 1  + sigma./alpha_s;
   % coeff = ones(49,1);
   % coeff = repmat(coeff, 1, m2*n2);
   % alpha_new = alpha./coeff;
    %P1 = V * alpha_new;
    P1 = V * alpha;
    %Q = P - P1;
   % imshow(Q);
    
    output_image = zeros(size(inp_img1));
    sum = output_image;
    pix =  ones(7,7);
    k1 = 1;
    for i = half_p + 1:m - half_p-1
        for j = half_p + 1:n-half_p -1
            p1 = P(:,k1);
            k1 = k1+ 1;
            p2 = reshape(p1, [7, 7]);
            %output_image(i - half_p: i + half_p,j - half_p: j + half_p) = output_image(i - half_p: i + half_p,j - half_p: j + half_p) + p2;
            %output_image(i - half_p: i + half_p,j - half_p: j + half_p) = output_image(i - half_p: i + half_p,j - half_p: j + half_p);
            %count = count + 1;
            %eps = output_image(i - half_p : i + half_p, j - half_p:j+half_p);
            %eps = eps +p2;
            output_image(i - half_p : i + half_p, j - half_p:j+half_p) = output_image(i - half_p : i + half_p, j - half_p:j+half_p) + p2;
            sum(i - half_p : i + half_p, j - half_p:j+half_p) =  sum(i - half_p : i + half_p, j - half_p:j+half_p) + pix;
        end 
    end
    
    %out_img = output_image/(patch_s * patch_s);
    out_img = output_image./sum;
   % figure; imshow(inp_img1);
    figure; imshow(inp_img1/max(inp_img1(:)));
    figure; imshow(out_img/max(out_img(:)));
   % figure; imshow(inp_img/max(out_img(:)));
        
    
    
end
