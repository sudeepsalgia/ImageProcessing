%% MyMainScript
close all;
tic;
%% Your code here
sup_moon = load('../data/superMoonCrop.mat');
sup_moon = sup_moon.imageOrig;

lion_crop = load('../data/lionCrop.mat');
lion_crop = lion_crop.imageOrig;


colorbar;
sup_moon_um = myUnsharpMasking(sup_moon,7,5,10);
lion_crop_um = myUnsharpMasking(lion_crop,9,3,10);


toc;
