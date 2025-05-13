function [ IS1,IS2,IS3,EC ] = embeddingEC( I,msg,t,number,dis ,endEC )

[m,n]=size(I);

IS1 = I;
IS2 = I;
IS3 = I;
EC = 1;

%embedding
for i=1:m
    if EC>=endEC
        break;
    end
    
    for j=1:n
        if EC>=endEC
            break;
        end
       
         x = I(i,j);
        %border
       
        if x<=t || x>=255-t 
            continue;
        end
        %%%%%%%%%创建shadows
        
        %先取secret-data，把secret-data变为comNum-进制的竖
        [label,EC] = getLableByBlocksize(msg,EC,number);
        
        
        [IS1(i,j),IS2(i,j),IS3(i,j)] = createShadows(x,label,dis);
        
        
    end
end


end

