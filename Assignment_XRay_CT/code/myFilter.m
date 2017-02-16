function [ Rout ] = myFilter( Rin , w, filter )
%MYFILTER Summary of this function goes here
%   Detailed explanation goes here

ff = fft(Rin);
ff = fftshift(ff);
%absff = log(abs(ff)+1);
%plot(absff);

a = 1+(size(Rin,1) - 1)/2;
cutoff = zeros(size(Rin));
cutoff(round(a/2) : round(3*a/2)) = 1;

if(filter == 1)    
    i1 = -(size(Rin,1) - 1)/2 : 1 : (size(Rin,1) - 1)/2;
    y1 = abs(i1);
    if(w == 2)
        y1 = y1.*cutoff';
    end
    ff = ff.*(y1');
end;


if(filter == 2)
    i2 = -(size(Rin,1) - 1)/2 : 1 : (size(Rin,1) - 1)/2;
    y2 = abs(i2)*(sin((0.5*3.142*i2)/(a-1))/(0.5*3.142*i2/(a-1)));
    y2(a) = 0;
    if(w == 2)
        y2 = y2.*cutoff';
    end
    ff = ff.*(y2'); 
end;


if(filter == 3)
    i3 = -(size(Rin,1) - 1)/2 : 1 : (size(Rin,1) - 1)/2;
    y3 = abs(i3).*cos((0.5*3.142*i3)/(a-1));
    if(w == 2)
       y3 = y3.*cutoff';
    end
    ff = ff.*(y3');
end;

if(filter == 4)    
    cutoff = zeros(size(Rin));
    cutoff(a - w : a + w) = 1;
    i4 = -(size(Rin,1) - 1)/2 : 1 : (size(Rin,1) - 1)/2;
    y4 = abs(i4).*cutoff';
    ff = ff.*(y4');
end;
%absff = log(abs(ff)+1);
%plot(absff);

ff = ifftshift(ff);
Rout = ifft(ff);

end
