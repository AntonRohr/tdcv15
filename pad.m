function padded_image = pad(input, padX, padY, type)
%Inititalise the an output array of the right size
padded_image = zeros(2*padX+size(input,1),2*padY+size(input,2));

%The interior of the padded image is simply the input image
padded_image(padX+1:end-padX, padY+1:end-padY) = input;

%Copy the border pixel throughout the padding
if strcmp(type,'replicate')
    %Left side
    padded_image(padY+1:end-padY,1:padX) = repmat(input(:,1),1,padX);
    %Right side
    padded_image(padY+1:end-padY,end-padX+1:end) = repmat(input(:,end),1,padX);
    %Top
    padded_image(1:padY,padX+1:end-padX) = repmat(input(1,:),padY,1);
    %Bottom
    padded_image(end-padY+1:end,padX+1:end-padX) = repmat(input(end,:),padY,1);
    % Corners
    padded_image(end-padY+1:end,end-padX+1:end) = ones(padX,padY)*input(end,end);
    padded_image(1:padX,1:padY) = ones(padX,padY)*input(1,1);
    padded_image(1:padX,end-padY+1:end) = ones(padX,padY)*input(1,end);
    padded_image(end-padX+1:end,1:padY) = ones(padX,padY)*input(end,1);

%A padding pixel n pixels from the border takes the value of the
%corresponding pixel -n pixels from the border. 
elseif strcmp(type,'symmetric')
    %Left side
    padded_image(padY+1:end-padY,1:padX) = fliplr(input(:,1:padX));
    %Right side
    padded_image(padY+1:end-padY,end-padX+1:end) = fliplr(input(:,end-padX+1:end));
    %Top
    padded_image(1:padY,padX+1:end-padX) = flipud(input(1:padY,:));
    %Bottom
    padded_image(end-padY+1:end,padX+1:end-padX) = flipud(input(end-padY+1:end,:));
    %Corners
    %rot90(x,2) is equivalent to flipud(fliplr(x)) but faster.
    padded_image(end-padY+1:end,end-padX+1:end) = rot90(input(end-padY+1:end,end-padX+1:end),2);
    padded_image(1:padX,1:padY) = rot90(input(1:padX,1:padY),2);
    padded_image(1:padX,end-padY+1:end) = rot90(input(1:padX,end-padY+1:end),2);
    padded_image(end-padX+1:end,1:padY) = rot90(input(end-padX+1:end,1:padY),2);
else
    error('Type of padding not defined!')
end
