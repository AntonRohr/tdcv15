function [ output ] = gaussian2d( u, v, sigma )

output = (exp(-(1/2)*((u^2+v^2)/(sigma^2))))/(2*pi*sigma^2);

end

