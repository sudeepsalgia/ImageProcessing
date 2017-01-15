function [ weights ] = patch_weights( img, size_small, size_large, sigma )
mid_small = (size_small -1)/2;
mid_large = (size_large -1)/2;
weights =zeros(size(size_large));
central_window = getNeighbourhoodWindow(img, (mid_small+mid_large), (mid_small+mid_large), size_small);
%disp(size(central_window));
for i = (mid_small+1):(mid_small+size_large)
    for j = (mid_small+1):(mid_small+size_large)
        if (~(i == mid_small+mid_large && j == mid_small+mid_large))
            
        q_window = getNeighbourhoodWindow(img, i, j, size_small);
        %disp(size(q_window));
        diff = (q_window - central_window).^2;
       % disp(diff);
        weights((i-mid_small), (j-mid_small)) = normpdf(sqrt(sum(diff(:))), 0, sigma);
        end
    
    end
end
weights = weights/sum(weights(:));

    
end

