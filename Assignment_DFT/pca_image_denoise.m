function [out_img] = pca_image_denoise(inp_img1, patch_size, window_size, Lx)
    half_p = (patch_size-1)/2;
    half_w = (window_size - 1)/2;
    sigma = 20;
    %inp_img3 = double(inp_img1)/255;
    inp_img2 = inp_img1 + uint8(randn(size(inp_img1))*sigma);
    %h = fspecial('gaussian',3,20);
    
    inp_img = double(inp_img2);
    
    inp_img = padarray(inp_img, [half_p + half_w, half_p + half_w], 'symmetric');
    [m,n] = size(inp_img);
    output_img = zeros(m,n);
    %count = 0;
    for i=half_w + half_p + 1:m-half_w - half_p -1
        for j=half_w + half_p + 1:n-half_w -half_p -1
            qref = getNeighbourhoodWindow(inp_img, i,j, patch_size);
            qref = qref(:);
            Q = [];
            diff_m = [];
            for k = i-half_w:i+half_w
                for l2 = j-half_w:j+half_w
%                    count = count + 1;
                    %disp(count);
                    q1 = getNeighbourhoodWindow(inp_img,k,l2,patch_size);
                    q1 = q1(:);
                    diff = q1 - qref;
                    diff = diff.^2;
                    diff = sum(diff);
                    Q = [Q q1];
                    diff_m = [diff_m diff];
                end
            end
            [~,ind] = sort(diff_m, 'ascend');
            ind = ind(1:Lx);
            Xref = Q(:,ind); %Xref is the matrix formed by the q1 to qL
            [V, ~] = eig(Xref * Xref');      
            alpha = V' * Xref;
            alpha_ref = V' * qref;
            alpha_2 = alpha.^2;
            alpha_const = sum(alpha_2(:))/Lx - sigma^2;
            alpha_cap = max(0,alpha_const);
            coeff = alpha_cap /( sigma^2 + (alpha_cap));
            beta_ref = coeff * alpha_ref;      
            qref_new = V * beta_ref;
            qref_new_m = reshape(qref_new, patch_size,patch_size);
            output_img(i-half_p:i+half_p, j-half_p:j+half_p) = output_img(i-half_p:i+half_p, j-half_p:j+half_p) + qref_new_m;            
        end
    end
    out_img = output_img/(patch_size * patch_size);
    figure; imshow(inp_img1);
    figure; imshow(inp_img);
    figure; imshow(out_img);
end