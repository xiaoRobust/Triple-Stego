function [  ] = PVDHistogram( I, IS1, IS2,IS3,min,max,imageName )
%PVDHistogram绘制PVD Histogram的图
%I - original image
%IS1 - Shadows1
%IS2 - Shadows2
%min - 最小的横坐标 -20
%max - 最大的横坐标 20
%imageName -  图片的title

   len = max-min+1;
    [m,n]=size(I);
    h = zeros(1,len);
    hs1= zeros(1,len);
    hs2= zeros(1,len);
    hs3= zeros(1,len);
   
     for i=1:m
        for j=1:2:n
            diff = I(i,j)-I(i,j+1);
            if diff>=min && diff <= max
                h(diff+21) = h(diff+21)+1;
            end
            
            diff = IS1(i,j)-IS1(i,j+1);
            if diff>=min && diff <= max
                hs1(diff+21) = hs1(diff+21)+1;
            end
            
             diff = IS2(i,j)-IS2(i,j+1);
            if diff>=min && diff <= max
                hs2(diff+21) = hs2(diff+21)+1;
            end

             diff = IS3(i,j)-IS3(i,j+1);
            if diff>=min && diff <= max
                hs3(diff+21) = hs3(diff+21)+1;
            end
        end
     end
    
     x=min:max;
     figure('NumberTitle', 'off', 'Name', imageName);
     plot(x,h,'-s',x,hs1,'-*',x,hs2,'-+',x,hs3,'-o');
     xlabel('Pixel value difference','FontSize',20);
     ylabel('Frequerency of pixel value difference','FontSize',20);
     l = legend('Cover','S1','S2','S3');
     set(l,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',20)
end

