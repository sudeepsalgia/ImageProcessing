function [output_image] = getGoodepsilon(T)

[Eu, C] = getCodedSnapshot(T);
[video] = mmread('cars.avi', 1:T , [0 54], 0 ,0);
frames = video.frames;
frame= [];

for k = 1:length(frames)
    g = frames(k).cdata;
    g = rgb2gray(g);
    frame(:,:,k) = double(g(end-119:end, end-239:end));
end

%Generate the DCT matrix basis assuming a patch size of 8X8
U = kron(dctmtx(8)', dctmtx(8)');

[m n T] = size(C);
denoised_image = zeros(size(C));
output_image = zeros(size(C));

%epsilons = [512, 800, 1000, 1500, 2000, 3000, 4000, 6000, 8000, 10000];
epsilons = [10000, 8000, 6000, 4000, 3000, 2000, 1500, 1000 ,800, 512];
tic;
for ctr = 1:length(epsilons)
%for k = 1:1
    weights = zeros(m,n);
    RMSEs = [];
    for i = 1:m-7
        %disp(i);
        for j = 1:n-7
       
            %Extract the patch to work over on and its corresponding sensing
            %matrix 
            patch = Eu(i:i+7,j:j+7);
            y = patch(:);
            A =[];
            for k = 1:T
                phi = C(i:i+7,j:j+7, k);
                A = [A diag(phi(:))*U];
            end;
        
            %Determine the A matrix
            %A = phi*U;
        
            %Applying the OMP over the patch
            %theta_new = ISTA(y,A,lambda, no_of_iters);
            [s, support_set] = OMP(y,A,epsilons(ctr));
            theta_new = zeros(192,1);
            theta_new(support_set) = s;
        
            %Find the corresponding pixel values and update the image and
            %simultaneously find the weights for each pixel
            for k = 1:T
                x_denoised = U*theta_new(64*k-63:64*k);
                denoised_image(i:i+7,j:j+7,k) = denoised_image(i:i+7,j:j+7,k) + reshape(x_denoised, [8,8]);
            end;
            weights(i:i+7,j:j+7) = weights(i:i+7,j:j+7) + ones(8,8);
        
        end;
    end;
    for k = 1:T
        output_image(:,:,k) = denoised_image(:,:,k)./weights;
        RMSEs = [RMSEs RMSE(frame(:,:,k), output_image(:,:,k))];
    end;
    disp(RMSEs);
end;
%end;
toc;


end