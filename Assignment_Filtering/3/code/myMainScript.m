%% MyMainScript

tic;
%% Your code here
barbara = load('../data/barbara.mat');
barbara = barbara.imageOrig;

% sigma* = 20   rms = 0.1106
% sigma* = 18   rms = 0.1151
% sigma* = 22   rms = 0.1156


barbara_patch = myPatchBasedFiltering(barbara, 12, 20, 9, 25);
rms = rmsd_bilateral(barbara, barbara_patch);
disp('optimum');
disp(rms);

toc;
