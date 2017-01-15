function [ ] = plotRecognitionRatesYale( )

k = [1 2 3 5 10 15 20 30 50 60 65 75 100 200 300 500 1000];
rate = [];

for i = 1: length(k)
    count = faceTestYale(k(i));
    element = count/760;
    rate = [rate element];
end

plot(k, rate);



end

