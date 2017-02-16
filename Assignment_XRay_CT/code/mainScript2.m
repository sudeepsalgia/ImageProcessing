%%% PART 1
load('../data/myPhantom.mat');

[ Rerr, minima, I, Rrec ] = reconstruction(imageAC, 256);
disp('Minimum Reconstruction Error for Phantom: ');
disp(minima);

disp('Angle Theta of Minimum Error for Phantom: ');
disp(I);

figure;
imshow(Rrec);
title('Reconstructed Phantom for Minimum Theta');

figure;
plot(Rerr);
title('Rerr vs Theta for Phantom');


%%% PART 2
load('../data/CT_Chest.mat');

[ Rerr1, minima, I, Rrec ] = reconstruction(imageAC, 512);
disp('Minimum Reconstruction Error for Chest: ');
disp(minima);

disp('Angle Theta of Minimum Error for Chest: ');
disp(I);

figure;
imshow(Rrec);
title('Reconstructed Chest for Minimum Theta');

grey = mat2gray(Rrec);
figure;
imshow(grey);

figure;
plot(Rerr1);
title('Rerr vs Theta for Chest');