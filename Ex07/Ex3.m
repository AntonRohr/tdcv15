RTs = zeros(45, 6);

%% Optimize the parameters of each transform matrix across frames
for i = 2:45
    energyfunc = @(R) energy( R, A, M_0s{i}, inliers_i{i}); 
    if (i == 2)
        init = [0,0,0,0,0,0];
    else
        init = RTs(i-1,:);
    end
    [result, val] = fminsearch(energyfunc, init, optimset('MaxFunEvals', 3000, 'Display', 'notify'));
    RTs(i,:) = result;
    a = result(1);
    b = result(2);
    c = result(3);
    Rx = [cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
    Ry = [cos(b),0,sin(b);0,1,0;-sin(b),0,cos(b)];
    Rz = [1,0,0;0,cos(c),-sin(c);0,sin(c),cos(c)];

    Rot = Rx * Ry * Rz;
    
    Ti = [result(4);result(5);result(6)];
    
    
    CamPose(i,:) = -Rot'*Ti;
    
end

plot3(CamPose(:,1), CamPose(:,2), CamPose(:,3));