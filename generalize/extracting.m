function [ msg_extract,IS ] = extracting( IS1,IS2,IS3,msg,locations,blocksize,comNum )
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
        t = (blocksize-1)/2;
        if (x1<=t  || x1>=255-t ) && x1==x2 && x2==x3
            IS(i,j) = IS1(i,j);
            continue;
        end
        
        [IS(i,j),msg_extract,idx] = extraction(x1,x2,x3,msg_extract,idx,locations,comNum);

       
        
    end
end


end

