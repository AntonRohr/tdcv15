savedRT_exp = zeros(44, 6);
savedRT_euler = zeros(44,6);

savedCam_exp = zeros(44, 3);
savedCam_euler = zeros(44,3);


for i = 1:44
 
    % x = [ux, uy, uz, t1, t2]  inliers{1}{1}(1:2,:)
    fExponential = @(x) energyFunction( x, A, inliers{i}{1}, inliers{i}{2});
    fEuler = @(x) energyEuler(x, A, inliers{i}{1}, inliers{i}{2});
    
    if i == 1
        init1 = [0,0,0,0,0,0];
        init2 = [0,0,0,0,0,0];
    else
        init1 = savedRT_exp(i-1,:);
        init2 = savedRT_euler(i-1,:);
    end

%% obtain R and T using exponential map
    
     % fminsearch for exponential map
     [x, fval] = fminsearch(fExponential, init1, optimset('MaxFunEvals', 3000, 'Display', 'notify'))
     savedRT_exp(i,:) = x;
    
     % obtain R using Rodrigues formula
     w_hat = [0, -x(3), x(2) ; x(3) , 0 -x(1) ; -x(2), x(1), 0];
     length_w = norm([x(1), x(2), x(3)]);    
    
     Ri_exp = eye(3) + w_hat / length_w * sin(length_w) + (w_hat^2)/(length_w^2) * (1-cos(length_w));
     Ti_exp = [x(4);x(5);x(6)];
    
 %% obtain R and T using Euler angles
 
     % fminsearch for Euler angles
     [x_eu, fval_eu] = fminsearch(fEuler, init2, optimset('MaxFunEvals', 3000, 'Display', 'notify'))
     savedRT_euler(i,:) = x_eu;
     
     alpha = x_eu(1);
     beta = x_eu(2);
     gamma = x_eu(3);
     Rx = [cos(alpha),-sin(alpha),0;sin(alpha),cos(alpha),0;0,0,1];
     Ry = [cos(beta),0,sin(beta);0,1,0;-sin(beta),0,cos(beta)];
     Rz = [1,0,0;0,cos(gamma),-sin(gamma);0,sin(gamma),cos(gamma)];
 
     Ri_euler = Rx * Ry * Rz;    
     Ti_euler = [x_eu(4) ; x_eu(5) ; x_eu(6)];
     
     
 %% get the camera position for exponential map and euler angles
    savedCam_exp(i,:) = -Ri_exp' * Ti_exp;
    savedCam_euler(i,:) = -Ri_euler' * Ti_euler;   
    
    
end

%% plot the cameraPositions

subplot(1,2,1);
plot3(savedCam_exp(:,1), savedCam_exp(:,2), savedCam_exp(:,3));

subplot(1,2,2);
plot3(savedCam_euler(:,1), savedCam_euler(:,2), savedCam_euler(:,3));
