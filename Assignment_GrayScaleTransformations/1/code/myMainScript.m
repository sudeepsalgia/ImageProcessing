%% MyMainScript

tic;
%% Your code here
circles_concentric = imread('../data/circles_concentric.png');
barbara_small = imread('../data/barbaraSmall.png');

img1 = myShrinkImageByFactorD(circles_concentric, 2);
img2 = myShrinkImageByFactorD(circles_concentric, 3);
figure('Name','original image Concentric Circles');
    imshow(circles_concentric);
    colorbar;
figure('Name','subsampled by d=2 image');
    imshow(img1);
    colorbar;
    %save('../subsampled_d_2_image', 'img1');
figure('Name','subsampled by d=3 image');
    imshow(img2);
    colorbar;
    %save('subsampled by d=3 image', 'img2');
    
img3 = myBilinearInterpolation(barbara_small);
figure('Name', 'Barbara Small');
    %axis image;
    imshow(barbara_small);
    colorbar;
figure('Name', 'Bilinear Interpolation');
    %axis image;
    imshow(img3);
    colorbar;
    
img4 = myNearestNeighborInterpolation(barbara_small);
figure('Name', 'Nearest Neighbors');
    imshow(img4);
    colorbar;
toc;
