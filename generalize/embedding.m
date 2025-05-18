function [ IS1,IS2,IS3,EC ] = embedding( I,msg,t,number,dis )

[m,n]=size(I);

IS1 = I;
IS2 = I;
IS3 = I;
EC = 1;

%embedding
for i=1:m
    for j=1:n
        
        x = I(i,j);
        %border
        if x<=t || x>=255-t 
            continue;
        end
        
        
        % Get secret bits£¬and convert it into number-based digit
        % label: number-based digit
        % EC: current embedded length of secret bits
        [label,EC] = getLableByBlocksize(msg,EC,number);
        
        % Construct shadow pixels 
        [IS1(i,j),IS2(i,j),IS3(i,j)] = createShadows(x,label,dis);
        
        
    end
end


end

