function cov = cal_cov_2d(pos1,pos2,stdev,scale,angle)
    % 两个坐标的位移向量
    
    dp = pos2 - pos1;
    
    %旋转
    if angle ~= 0
        angle = deg2rad(angle);
        RotMat = [cos(angle), -sin(angle);
              sin(angle),  cos(angle)];
        dp = dp .* RotMat';
    end 
    
    % 缩放
    dp= dp ./ scale;
    
    % 距离
    dist = sqrt(dp(:,1).^2 + dp(:,2).^2);
    
    % 协方差
    semiv = semi_variogram(dist,stdev);
    cov = stdev.^2 - semiv; 
    
end

