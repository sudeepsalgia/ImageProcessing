%% MyMainScript

tic;
%% Your code here

%optimum : 0.0332 ;     [1.701, 10.01, 11]
%a : 0.0559;       [1.5309, 10.01, 11]
%b : 0.0368        [1.8771, 10.01, 11]
%c : 0.0439          [1.701, 9.009, 11]
%d : 0.0360        [1.701, 11.011, 11]

close all;
barbara = load('../data/barbara.mat');
barbara = barbara.imageOrig;

barbara_bilateral = myBilateralFiltering(barbara, 10, 10.01, 25);
disp('optimum'); 
r = rmsd_bilateral(barbara_bilateral, barbara););   
disp(r);

toc;
