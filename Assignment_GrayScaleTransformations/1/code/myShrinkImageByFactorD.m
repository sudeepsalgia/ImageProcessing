function [out_img] = myShrinkImageByFactorD(inp_img, d)
    out_img = inp_img(1:d:end, 1:d:end);
end