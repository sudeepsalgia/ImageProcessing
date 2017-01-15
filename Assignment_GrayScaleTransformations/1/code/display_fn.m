function display_fn(img1, img2, img3)
figure;
if nargin == 2
    subplot(1,2,1);
    imshow(img1);
    subplot(1,2,2);
    imshow(img2);
end
if nargin == 3
    subplot(2,2,1);
    imshow(img1);
    subplot(2,2,2);
    imshow(img2);
    subplot(2,2,3);
    imshow(img3);
end