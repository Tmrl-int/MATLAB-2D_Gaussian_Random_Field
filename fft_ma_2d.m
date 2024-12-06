function random_field = fft_ma_2d(nx, dx, ny, dy, mean_value, stdev, scale, angle)
    % 获取维度
    ndim = length(scale);

    % 获取最小2次幂方便进行fft
    nx_c = nextpow2(nx*2);
    ny_c = nextpow2(ny*2);
    
    % 扩大范围
    % 创建扩展的x和y坐标
    x = (0:nx_c-1) * dx;
    y = (0:ny_c-1) * dy;
    

    % 使用meshgrid生成网格坐标
    [X, Y] = meshgrid(x, y);
    X = X';
    Y = Y';
    

    % 计算中心点到网格上每个点的距离（在x和y方向上）
    h_x = X - x(ceil(nx_c / 2)+1); 
    h_y = Y - y(ceil(ny_c / 2)+1);
    
    
    % 将坐标展平成列向量，并组合成坐标矩阵
    h_x_T = h_x';
    h_y_T = h_y';
    coords = [h_x_T(:), h_y_T(:)];
    [col,row] = size(coords);

    % 协方差
    cov = cal_cov_2d(zeros(col,row),coords,stdev,scale,angle);
    cov_reshaped = reshape(cov,[nx_c,ny_c]);
    

    % FFT
    fftS = fftshift(cov_reshaped);
    fftS = fftS';
    fftC = fft2(fftS);
   
    % 生成标准正态分布的随机数
    z_rand = randn(size(fftC));
    
    % IFFT
    out= ifft2(sqrt(fftC).*fft2(z_rand));
    random_field = real(out(1:nx,1:ny))+mean_value;
    
end

