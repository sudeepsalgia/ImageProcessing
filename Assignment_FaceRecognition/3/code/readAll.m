function [output] = readAll()
output = [];
folder = uigetdir();
folder = [folder '/s'];
for i = 33 : 40
    %foldername = strcat('C:\Users\Sudeep\Desktop\Sudeep\Semester 5\CS 663\Assignment 4\FaceDatabase\s',num2str(i),'\');
    
    foldername = strcat(folder,num2str(i),'/');
    for j = 7:10
    %disp(filename);
    filename = strcat(foldername,num2str(j),'.pgm');
    X = imread(filename);
    X = double(X)/255;
    output = [output, X(:)];
    %figure, imshow(X);
    end 
end
    %sample = X(300:512 , 300:512);
    %if(size(X,3) == 1)
    %    X( x:x+199 , y:y+199 ) = m;
    %else
    %    X( x:x+199 , y:y+199 ,1 ) = m;
    %    X( x:x+199 , y:y+199 ,2 ) = m;
    %    X( x:x+199 , y:y+199 ,3 ) = m;
    %end;
    
   % output = myCLAHE(img, i/10, 101);
   % figure, imshow(output);
   % imwrite(output, strcat('C:\Users\Sudeep\Desktop\Sudeep\Semester 5\CS 663\CLAHE101\', num2str(i),'.png'), 'png'); 
end