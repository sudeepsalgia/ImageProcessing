function [out_img] = myUnsharpMasking(inp_img, hsize, sigma, s)
    %for lioncrop use 9,3,10
    h = fspecial('log', hsize, sigma);
    out_1 = imfilter(inp_img, h);
    out_2 = inp_img - s * out_1;
    out_2 = out_2 - min(out_2(:));
    out_2 = out_2 / (max(out_2(:)));
    out_img = uint8(out_2 * 255);
    figure; imshow(inp_img, [min(inp_img(:)), max(inp_img(:))]);
%     figure; imshow(out_img, [min(out_img(:)), max(inp_img(:))]);
    figure; imshow(out_img);
end