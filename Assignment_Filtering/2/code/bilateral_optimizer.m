rmsd = 1000;
optimized = [0 0 0];
count = 0;

%2.1,9.1,7

for win_size=1:2:10
    for sigma_s=0.1:1:10
        for sigma_r=0.1:1:10
            count = count + 1;
            out = myBilateralFiltering(barbara, sigma_s, sigma_r, win_size);
            rm = rmsd_bilateral(out,barbara);
            close all;
            if ( rm < rmsd)
                count
                rmsd = rm
                optimized = [sigma_s, sigma_r, win_size]
            end
        end
    end
end