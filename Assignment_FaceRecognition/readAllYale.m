function [databaseYale, testsetYale] = readAllYale()
databaseYale = [];
testsetYale = [];
for i = 1 : 39
    foldername = '/home/sudeep/Semester 5/CS 663/CroppedYale/yaleB';
    if (i < 10)
        foldername = strcat(foldername, '0',num2str(i),'/');
    else if (i == 14)
            continue;
        else
            foldername = strcat(foldername,num2str(i),'/');
        end
    end
    srcFiles = dir(strcat(foldername,'*.pgm'));
    
    for j = 1:40
    
    filename = strcat(foldername,srcFiles(j).name);
    X = imread(filename);
    X = double(X)/255;
    databaseYale = [databaseYale, X(:)];
   
    end
    
        
    for j = 41:60
    
    filename = strcat(foldername,srcFiles(j).name);
    X = imread(filename);
    X = double(X)/255;
    testsetYale = [testsetYale, X(:)];
   
    end 
end
     
end