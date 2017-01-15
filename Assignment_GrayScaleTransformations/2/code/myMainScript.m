%%MyMainScript

tic;
%%Your code here
barbara = imread('../data/barbara.png');
canyon = imread('../data/canyon.png');
tem = imread('../data/TEM.png');
canyon_r = canyon(:,:,1);
canyon_g = canyon(:,:,2);
canyon_b = canyon(:,:,3);

barbara_lc = myLinearContrastStretching(barbara, 30, 10, 170,220);
barbara_he = myHE_n(barbara);
barbara_ahe = myAHE_n(barbara, 101);
barbara_clahe = myCLAHE_n(barbara, 0.004, 101);

canyon_lc(:,:,1) = myLinearContrastStretching(canyon_r, 50, 100, 180, 150);
canyon_lc(:,:,2) = myLinearContrastStretching(canyon_g, 50, 100, 255, 255);
canyon_lc(:,:,3) = myLinearContrastStretching(canyon_b,50, 100, 255, 255);

canyon_he = myHE_n(canyon);
canyon_ahe = myAHE_n(canyon, 101);
canyon_clahe = myCLAHE_n(canyon, 0.5, 101);

tem_lc = myLinearContrastStretching(tem, 100, 10, 210,250);
tem_he = myHE_n(tem);
tem_ahe = myAHE_n(tem, 101);
tem_clahe = myCLAHE_n(tem, 0.5, 101);

figure('Name','original image Barbara');
    imshow(barbara);
figure('Name', 'linear contrast Barbara');
    imshow(barbara_lc);
    colorbar;
figure('Name','HE Barbara');
    imshow(barbara_ahe);    
figure('Name','AHE Barbara');
    imshow(barbara_he);  
figure('Name','CLAHE Barbara');
    imshow(barbara_clahe);  
    
figure('Name','original image Canyon');
    imshow(canyon);
figure('Name', 'LC Canyon');
    imshow(canyon_lc);
    colorbar;
figure('Name','HE Canyon');
    imshow(canyon_he);    
figure('Name','AHE Canyon');
    imshow(canyon_ahe);  
figure('Name','CLAHE Canyon');
    imshow(canyon_ahe);  
    
figure('Name','original image Tem');
    imshow(tem);
figure('Name', 'linear contrast Tem');
    imshow(tem_lc);
    colorbar;
figure('Name','HE Tem');
    imshow(tem_he);    
figure('Name','AHE Tem');
    imshow(tem_ahe);  
figure('Name','CLAHE Tem');
    imshow(tem_clahe);  

toc;

