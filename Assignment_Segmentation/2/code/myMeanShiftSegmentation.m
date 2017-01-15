function [out_img] = myMeanShiftSegmentation(inp_img1)
    inp_img = double(inp_img1)/255;
    [m,n] = size(inp_img);
    x1 = 1:3;
    y1 = 1:3;
    sigma_x = 1;
    sigma_y = 1;
    
    g_x = normpdf(x1, 0, sigma_x);
    g_y = normpdf(y1, 0, sigma_y);
    g_xy = g_x' * g_y;
    
    smooth_img(:,:,1) = conv2(inp_img(:,:,1), g_xy, 'same');
    smooth_img(:,:,2) = conv2(inp_img(:,:,2), g_xy, 'same');
    smooth_img(:,:,3) = conv2(inp_img(:,:,3), g_xy, 'same');
    figure; imshow(inp_img(:,:,1));
    figure;imshow(smooth_img(:,:,1));
    
end