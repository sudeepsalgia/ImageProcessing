function [out_img] = myAHE_n(inp_img, N)
    [m,n1,p] = size(inp_img);
    out_img = inp_img;
    if (p ~=1)
        for i=1:p
            out_img(:,:,i) = myAHE(inp_img(:,:,i),N);
        end
    else
        out_img = myAHE(inp_img, N);
    end
    
end
