function [out_img] = myCLAHE_n(inp_img,h, N)
    [m,n1,p] = size(inp_img);
    out_img = inp_img;
    if (p ~=1)
        for i=1:p
            out_img(:,:,i) = myCLAHE(inp_img(:,:,i),h,N);
        end
    else
        out_img = myCLAHE(inp_img,h,N);
    end 
end
