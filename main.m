function main()
    
    
    % 2d参数
    nx=100;dx=1; ny=100; dy=1; mean_value=0;stdev=1;scale=[30,3];angle=0;
    
    % 2d
    random_field = fft_ma_2d(nx,dx,ny,dy,mean_value,stdev,scale,angle);
    random_field = random_field';
    figure;
    pcolor(random_field);
    shading interp;
    axis equal;
    axis tight;

end

