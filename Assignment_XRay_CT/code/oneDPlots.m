function oneDPlots( img )
%ONEDPLOTS Summary of this function goes here
%   Detailed explanation goes here


y = zeros(181,1);
y0_1 = zeros(181,1);
y0_2 = zeros(181,1);
y0_3 = zeros(181,1);

y90_1 = zeros(181,1);
y90_2 = zeros(181,1);
y90_3 = zeros(181,1);

for x = -90:1:90,
    y0_1(x+91) = myIntegration(img, x, 0, 0.5);
    y0_2(x+91) = myIntegration(img, x, 0, 1);
    y0_3(x+91) = myIntegration(img, x, 0, 3);
end;

for x = -90:1:90,
    y90_1(x+91) = myIntegration(img, x, 90, 0.5);
    y90_2(x+91) = myIntegration(img, x, 90, 1);
    y90_3(x+91) = myIntegration(img, x, 90, 3);
end;

x = -90:1:90;
figure;
subplot(2,3,1), plot(x,y0_1), title('S = 0.5 Theta = 0');

subplot(2,3,2), plot(x,y0_2), title('S = 1 Theta = 0');

subplot(2,3,3), plot(x,y0_3), title('S = 3 Theta = 0');

subplot(2,3,4), plot(x,y90_1), title('S = 0.5 Theta = 90');

subplot(2,3,5), plot(x,y90_2), title('S = 1 Theta = 90');

subplot(2,3,6), plot(x,y90_3), title('S = 3 Theta = 90');

%plot(x,y1, 'r');
%hold on;
%plot(x,y2, 'g');
%plot(x,y3, 'b');
%legend;
end

