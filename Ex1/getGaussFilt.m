function [ g dG ddG dddG x ] = getGaussFilt(t)

x = -(3*t-1)/2:1:(3*t-1)/2;
g = 1/sqrt(2*pi*t)*exp(-x.^2/(2*t));
dG = -x/sqrt(2*pi*t^3).*exp(-x.^2/(2*t));
ddG = (x-sqrt(t)).*(x+sqrt(t))/sqrt(2*pi*t^5).*exp(-x.^2/(2*t));
dddG = -x.*(x.^2-3*t)/sqrt(2*pi*t^7).*exp(-x.^2/(2*t));

end

