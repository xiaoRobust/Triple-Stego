function [ msg_extract,IS ] = extracting( IS1,IS2,IS3,msg,dis,t,number )
%extraction
[m,n] = size(IS1);
msg_extract = msg;
IS = zeros(m,n);
idx=1;
for i=1:m
    for j=1:1:n
        

      
        x1 = IS1(i,j);
        x2 = IS2(i,j);
        x3 = IS3(i,j);
        
        %border
        if (x1<=t  || x1>=255-t ) && x1==x2 && x2==x3
            IS(i,j) = IS1(i,j);
            continue;
        end
        
        % Extract from three stego pixels 
        [IS(i,j),msg_extract,idx] = extraction(x1,x2,x3,msg_extract,idx,dis,number);

       
        
    end
end


end

