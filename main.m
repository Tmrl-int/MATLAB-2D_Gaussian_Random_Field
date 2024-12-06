function main()
    flag = "2d";
    if isequal(flag,"2d")
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
    else
        % 3d参数
        nx=50; dx=1; ny=100; dy=1; nz=75; dz=1; mean_value=0; stdev=1; 
        angle=[0,0,0];

        % 3d
        % 切片
        scale=[25,2,2];
        random_field = fft_ma_3d(nx,dx,ny,dy,nz,dz,mean_value,stdev,scale,angle);
        
        for i = 1:10:30
            figure;  
            pcolor(reshape(random_field(:,:,i),[100,50]))
            shading interp;
            axis equal;
            axis tight;
        end
        for i = 1:10:30
            figure;
            pcolor(reshape(random_field(:,i,:),[75,50]))
            shading interp;
            axis equal;
            axis tight;
        end


        scale=[2,25,2];
        random_field = fft_ma_3d(nx,dx,ny,dy,nz,dz,mean_value,stdev,scale,angle);
        
        for i = 1:10:30
            figure;
            pcolor(reshape(random_field(:,:,i),[100,50]))
            shading interp;
            axis equal;
            axis tight;
        end
        for i = 1:10:30
            figure;
            
            pcolor(reshape(random_field(i,:,:),[75,100]))
            shading interp;
            axis equal;
            axis tight;
        end
        

%         scale=[25,2,2];
%         [X,Y,Z,random_field] = fft_ma_3d(nx,dx,ny,dy,nz,dz,mean_value,stdev,scale,angle);
%         
%         [faces,verts] = isosurface(random_field);
%         figure;
%         hold on;
%         
%         patch('Faces', faces, 'Vertices', verts, 'FaceColor', 'green', 'EdgeColor', 'none')
%         % 设置坐标轴
%         axis equal;
%         xlabel('X');
%         ylabel('Y');
%         zlabel('Z');
%         grid on;
%          
%         % 可选：添加光照效果
%         camlight;
%         lighting gouraud;
%         
%          
%         % 显示图形
%         view(3); % 设置视角为三维视角
        

    end
     
    
    
end

