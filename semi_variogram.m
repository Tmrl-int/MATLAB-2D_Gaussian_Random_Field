function semiv = semi_variogram(h,stdev)
    % 高斯分布方差计算
    semiv = stdev^2.*(1-exp(-h.^2));
end

