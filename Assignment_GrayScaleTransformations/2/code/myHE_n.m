function [out_img] = myHE_n(inp_img)
    [m,n,p] = size(inp_img);
    out_img = inp_img;
    if (p ~=1)
        for i=1:p
            out_img(:,:,i) = myHE(inp_img(:,:,i));
        end
    else
        out_img = myHE(inp_img);
    end
    
end
