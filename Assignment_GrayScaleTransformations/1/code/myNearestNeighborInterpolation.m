function [out_img] = myNearestNeighborInterpolation(inp_img)
    [m n] = size(inp_img);
     out_img = zeros(3*m - 2, 2*n -1);
     
     out_img(1:3:end, 1:2:end) = inp_img;	% copy the original image to the correct positions
     
     out_img(1:3:end, 2:2:end) = out_img(1:3:end, (1:2:end-1) + 2);	% copy the nearest neighbours
     
     out_img(2:3:end, 1:2:end) = out_img(1:3:end-1, 1:2:end);
    
     out_img(2:3:end, 2:2:end) = out_img(2:3:end, (1:2:end-1) + 2);
    
     out_img(3:3:end, 1:2:end) = out_img((1:3:end-1) + 3, 1:2:end);
    
    out_img(3:3:end, 2:2:end) = out_img(3:3:end, (1:2:end-1) + 2);
    
    out_img = uint8(out_img);
end