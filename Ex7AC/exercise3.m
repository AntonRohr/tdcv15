savedRT = zeros(44, 6);


for i = 1:44
 
    % x = [ux, uy, uz, t1, t2]  inliers{1}{1}(1:2,:)
    fExponential = @(x) energyFunction( x, A, inliers{i}{1}, inliers{i}{2}); 
    if i == 1
        init = [0,0,0,0,0,0];
    else
        init = savedRT(i-1,:);
    end
    [x, fval] = fminsearch(fExponential, init, optimset('MaxFunEvals', 3000, 'Display', 'notify'))
    savedRT(i,:) = x;
    
    % obtain R using Rodrigues formula
    w_hat = [0, -x(3), x(2) ; x(3) , 0 -x(1) ; -x(2), x(1), 0];
    length_w = norm([x(1), x(2), x(3)]);    
    Ri = eye(3) + w_hat / length_w * sin(length_w) + (w_hat^2)/(length_w^2) * (1-cos(length_w));
    
    %alpha = x(1);
    %beta = x(2);
    %gamma = x(3);
    %Rx = [cos(alpha),-sin(alpha),0;sin(alpha),cos(alpha),0;0,0,1];
    %Ry = [cos(beta),0,sin(beta);0,1,0;-sin(beta),0,cos(beta)];
    %Rz = [1,0,0;0,cos(gamma),-sin(gamma);0,sin(gamma),cos(gamma)];

    %Ri = Rx * Ry * Rz;
    
    Ti = [x(4);x(5);x(6)];
    
    
    savedCam(i,:) = -Ri'*Ti;
    
end

plot3(savedCam(:,1), savedCam(:,2), savedCam(:,3));