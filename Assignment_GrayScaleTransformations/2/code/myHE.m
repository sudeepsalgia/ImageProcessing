function [out_img] = myHE(inp_img)
    inp_hist = imhist(inp_img);
    inp_hist = double(inp_hist);
    [m n] = size(inp_img(:));
    inp_hist = inp_hist / m;    %get the pdf(r)
    
    T = cumsum(inp_hist);	% get the transformation r to s
    
    out_img = T(inp_img + 1);   % +1 for index error reasons
    
    out_img = uint8(out_img * 255);    
end
