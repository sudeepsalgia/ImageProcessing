function [ ] = plotRecognitionRates( )

k = [1 2 3 5 10 15 20 30 50 75 100 150 170];
rate = [];

for i = 1: length(k)
    count = faceTest(k(i));
    element = count/132;
    rate = [rate element];
end

plot(k, rate);



end

