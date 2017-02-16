function [Eu, C] = getCodedSnapshot(T)
% This code uses mmread and hence we need to keep in mind that we might
% need some specific files to run the same

%The first part will be to generate the Eu using the frames
% Extract the frames
[video] = mmread('cars.avi', 1:T , [0 54], 0 ,0);
frames = video.frames;
f= [];

for k = 1:length(frames)
    g = frames(k).cdata;
    g = rgb2gray(g);
    f(:,:,k) = double(g(end-119:end, end-239:end));
end

[m n] = size(f(:,:,1));

% Generate the random coded binary sequences 
C = randi([0 1], [m n length(frames)]);

image = sum(C.*f, 3);

%Adding a gaussian noise to the system
Eu = image + 2*randn(m,n);

%figure; imshow(Eu, [min(Eu(:)),max(Eu(:))]);





end