function [ ] = plot_match( )

k = [1 2 3 5 10 15 20 30 50 75 100 150 170];
rate_fp = [];
rate_fn = [];

for i = 1: length(k)
    [fp,fn] = face_match_thresh(k(i));
%     element1 = fp/132;
%     element2 = fn/132;
    rate_fp = [rate_fp fp];
    rate_fn = [rate_fn fn];
end
figure;
plot(k, rate_fp);
figure;
plot(k,rate_fn);



end

