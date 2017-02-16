function [output_image] = question2(T)
% This code uses mmread and hence we need to keep in mind that we might
% need some specific files to run the same
%Get the coded Snapshot on which we have to work
[Eu, C] = getCodedSnapshot(T);

%Generate the original frames for comparison
[video] = mmread('cars.avi', 1:T , [0 54], 0 ,0);
frames = video.frames;
frame= [];

for k = 1:length(frames)
    g = frames(k).cdata;
    g = rgb2gray(g);
    frame(:,:,k) = double(g(end-119:end, end-239:end));
end;

%Generate the DCT matrix basis assuming a patch size of 8X8
U = kron(dctmtx(8)', dctmtx(8)');

[m n T] = size(C);
reconstructed_image = zeros(size(C));
output_image = zeros(size(C));
weights = zeros(m,n);

tic;

    
for i = 1:m-7
    for j = 1:n-7
       
        %Extract the patch to work over on and its corresponding sensing
        %matrix and generate the A matrix
        patch = Eu(i:i+7,j:j+7);
        y = patch(:);
        A =[];
        for k = 1:T
            phi = C(i:i+7,j:j+7, k);
            A = [A diag(phi(:))*U];
        end;
     
            
        %Applying the OMP over the patch with a user choice of error
        %parameter which has to be varied here
        
        [s, support_set] = OMP(y,A, 700);
        theta_new = zeros(64*T,1);
        theta_new(support_set) = s;
       
        %Find the corresponding pixel values and update the image and
        %simultaneously find the weights for each pixel for all the frames
        for k = 1:T
            reconstructed_patch = U*theta_new(64*k-63:64*k);
            reconstructed_image(i:i+7,j:j+7,k) = reconstructed_image(i:i+7,j:j+7,k) + reshape(reconstructed_patch, [8,8]);
        end;
        weights(i:i+7,j:j+7) = weights(i:i+7,j:j+7) + ones(8,8);        
    end;
end;
    
rootMeanErrors = [];
for k = 1:T
    output_image(:,:,k) = reconstructed_image(:,:,k)./weights;
    rootMeanErrors = [rootMeanErrors RMSE(frame(:,:,k), output_image(:,:,k))];
    figure;
    subplot(1,2,1);
    imshow(output_image(:,:,k) , [min(min(output_image(:,:,k))) , max(max(output_image(:,:,k)))]);
    title('Reconstructed Image');
    
    subplot(1,2,2);
    imshow(frame(:,:,k) , [min(min(frame(:,:,k))) , max(max(frame(:,:,k)))]);
    title('Original Image');    
end;

disp(rootMeanErrors);


toc;


end