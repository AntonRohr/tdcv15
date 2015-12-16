RTs_exp = zeros(45, 6);
RTs_euler = zeros(45, 6);

for i = 2:45
    if (i == 2)
        init_exp = [0,0,0,0,0,0];
        init_euler = [0,0,0,0,0,0];
    else
        init_exp = RTs_exp(i-1,:);
        init_euler = RTs_exp(i-1,:);
    end
    [result_exp, ~] = fminsearch(@(R) energyExp( R, A, M_0s{i}, inliers_i{i}), init_exp, optimset('MaxFunEvals', 3000, 'Display', 'notify'));
    [result_euler, ~] = fminsearch(@(R) energyEuler( R, A, M_0s{i}, inliers_i{i}), init_euler, optimset('MaxFunEvals', 3000, 'Display', 'notify'));
    
    RTs_exp(i,:) = result_exp;
    w_hat = [0, -result_exp(3), result_exp(2) ; result_exp(3) , 0 -result_exp(1) ; -result_exp(2), result_exp(1), 0];
    length_w = norm([result_exp(1), result_exp(2), result_exp(3)]);    
    Ri = eye(3) + w_hat / length_w * sin(length_w) + (w_hat^2)/(length_w^2) * (1-cos(length_w));
    Ti = [result_exp(4);result_exp(5);result_exp(6)];
    CamPoseExp(i,:) = -Ri'*Ti;
    
    RTs_euler(i,:) = result_euler;
    a = result_euler(1);
    b = result_euler(2);
    c = result_euler(3);
    Rx = [cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
    Ry = [cos(b),0,sin(b);0,1,0;-sin(b),0,cos(b)];
    Rz = [1,0,0;0,cos(c),-sin(c);0,sin(c),cos(c)];
    Rot = Rx * Ry * Rz;
    Te = [result_euler(4);result_euler(5);result_euler(6)];
    CamPoseEuler(i,:) = -Rot'*Te;
    
    
    
end
CamPoseExp(1,:) = -eye(3,3)' * [0;0;0];
figure;
plot3(CamPoseExp(:,1), CamPoseExp(:,2), CamPoseExp(:,3));title('Exponential Method');
figure;
plot3(CamPoseEuler(:,1), CamPoseEuler(:,2), CamPoseEuler(:,3));title('Euler Method');